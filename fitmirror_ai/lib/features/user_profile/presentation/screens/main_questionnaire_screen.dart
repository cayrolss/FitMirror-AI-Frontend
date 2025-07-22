// lib/features/user_profile/presentation/screens/main_questionnaire_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitmirror_ai/features/user_profile/presentation/providers/main_questionnaire_controller.dart';
import 'package:fitmirror_ai/core/enums.dart'; // Para los Enums
import 'package:fitmirror_ai/features/user_profile/domain/entities/main_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/complete_user_profile_entity.dart';
import 'package:fitmirror_ai/features/user_profile/presentation/providers/user_profile_providers.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MainQuestionnaireScreen extends ConsumerStatefulWidget {
  const MainQuestionnaireScreen({super.key});

  @override
  ConsumerState<MainQuestionnaireScreen> createState() =>
      _MainQuestionnaireScreenState();
}

class _MainQuestionnaireScreenState
    extends ConsumerState<MainQuestionnaireScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _currentWeightController =
      TextEditingController();
  final TextEditingController _goalWeightController = TextEditingController();

  Gender? _selectedGender;
  ActivityLevel? _selectedActivityLevel;
  WeightChangeGoal? _selectedWeightChangeGoal;
  WeightChangeSpeed? _selectedWeightChangeSpeed;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final user = FirebaseAuth.instance.currentUser;
      if (user != null) {
        final currentProfile = ref
            .read(completeUserProfileStreamProvider(user.uid)) // Usa user.uid
            .value;
        if (currentProfile != null) {
          _nameController.text = currentProfile.username ?? '';
          final mainData = currentProfile.mainQuestionnaire;
          if (mainData.age != 0) _ageController.text = mainData.age.toString();
          if (mainData.heightCm != 0)
            _heightController.text = mainData.heightCm.toString();
          if (mainData.weightKg != 0.0)
            _currentWeightController.text = mainData.weightKg.toString();
          if (mainData.goalWeightKg != null && mainData.goalWeightKg != 0.0)
            _goalWeightController.text = mainData.goalWeightKg.toString();

          _selectedGender = mainData.gender;
          _selectedActivityLevel = mainData.activityLevel;
          _selectedWeightChangeGoal = mainData.weightChangeGoal;
          _selectedWeightChangeSpeed = mainData.weightChangeSpeed;
        }
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _nameController.dispose();
    _ageController.dispose();
    _heightController.dispose();
    _currentWeightController.dispose();
    _goalWeightController.dispose();
    super.dispose();
  }

  void _nextPage() {
    if (_currentPage < 3) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentPage++;
      });
    } else {
      _handleFinishQuestionnaire();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
      setState(() {
        _currentPage--;
      });
    }
  }

  void _handleFinishQuestionnaire() async {
    final mainQuestionnaireController =
        ref.read(mainQuestionnaireControllerProvider.notifier);
    final userProfileNotifier =
        ref.read(userProfileControllerProvider.notifier);
    final user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      print(
          'Error: Usuario no logueado al finalizar el cuestionario principal.');
      return;
    }

    final mainData = MainQuestionnaireDataEntity(
      age: int.tryParse(_ageController.text) ?? 0,
      gender: _selectedGender ?? Gender.male,
      heightCm: int.tryParse(_heightController.text) ?? 0,
      weightKg: double.tryParse(_currentWeightController.text) ?? 0.0,
      activityLevel: _selectedActivityLevel ?? ActivityLevel.sedentary,
      weightChangeGoal: _selectedWeightChangeGoal ?? WeightChangeGoal.maintain,
      goalWeightKg: double.tryParse(_goalWeightController.text),
      weightChangeSpeed: _selectedWeightChangeSpeed ?? WeightChangeSpeed.normal,
    );

    await mainQuestionnaireController.saveMainQuestionnaireData(
        user.uid, mainData);

    await userProfileNotifier.updateQuestionnaireStep(user.uid, 'gym');

    if (context.mounted) {
      context.go('/gym-questionnaire');
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    // Pasa el uid al provider, si user es null, pasa un string vacío para evitar null
    final AsyncValue<CompleteUserProfileEntity?> userProfileAsync =
        ref.watch(completeUserProfileStreamProvider(user?.uid ?? ''));

    String displayedUsername = '';
    userProfileAsync.whenOrNull(
      data: (profile) {
        if (profile != null) {
          _nameController.text = profile.username ?? '';
          displayedUsername = profile.username ?? '';
        }
      },
      loading: () => displayedUsername = 'Cargando nombre...',
      error: (e, st) => displayedUsername = 'Error cargando nombre',
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuestionario Principal'),
        leading: _currentPage > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _previousPage,
              )
            : null,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,
                physics: const NeverScrollableScrollPhysics(),
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  _buildPersonalInfoPage(displayedUsername),
                  _buildActivityAndGoalPage(),
                  _buildWeightChangeSpeedPage(),
                  _buildSummaryPage(),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage < 3)
                  ElevatedButton(
                    onPressed: _nextPage,
                    child: const Text('Siguiente'),
                  ),
                if (_currentPage == 3)
                  ElevatedButton(
                    onPressed: _handleFinishQuestionnaire,
                    child: const Text('Finalizar'),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPersonalInfoPage(String username) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('¡Hola! Cuéntanos un poco sobre ti:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          TextField(
            controller: _nameController,
            decoration: const InputDecoration(labelText: 'Tu nombre'),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _ageController,
            decoration: const InputDecoration(labelText: 'Edad'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _heightController,
            decoration: const InputDecoration(labelText: 'Altura (cm)'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _currentWeightController,
            decoration: const InputDecoration(labelText: 'Peso actual (kg)'),
            keyboardType: TextInputType.number,
          ),
          const SizedBox(height: 20),
          GenderSelectionChips(
            selectedGender: _selectedGender,
            onSelect: (gender) {
              setState(() {
                _selectedGender = gender;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildActivityAndGoalPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('¿Cuál es tu nivel de actividad y tu objetivo?',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          ActivityLevelChips(
            selectedActivityLevel: _selectedActivityLevel,
            onSelect: (level) {
              setState(() {
                _selectedActivityLevel = level;
              });
            },
          ),
          const SizedBox(height: 20),
          WeightChangeGoalChips(
            selectedGoal: _selectedWeightChangeGoal,
            onSelect: (goal) {
              setState(() {
                _selectedWeightChangeGoal = goal;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _buildWeightChangeSpeedPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Detalles sobre tu objetivo de peso:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          WeightChangeSpeedChips(
            currentSpeed: _selectedWeightChangeSpeed,
            onSelect: (speed) {
              setState(() {
                _selectedWeightChangeSpeed = speed;
              });
            },
          ),
          const SizedBox(height: 20),
          if (_selectedWeightChangeGoal != WeightChangeGoal.maintain)
            TextField(
              controller: _goalWeightController,
              decoration:
                  const InputDecoration(labelText: 'Peso objetivo (kg)'),
              keyboardType: TextInputType.number,
            ),
        ],
      ),
    );
  }

  Widget _buildSummaryPage() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('¡Casi listo! Revisa tus datos:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 20),
          Text('Nombre: ${_nameController.text}'),
          Text('Edad: ${_ageController.text} años'),
          Text('Altura: ${_heightController.text} cm'),
          Text('Peso actual: ${_currentWeightController.text} kg'),
          Text(
              'Género: ${_selectedGender?.toShortString().capitalize() ?? 'No especificado'}'),
          Text(
              'Nivel de Actividad: ${_selectedActivityLevel?.toShortString().capitalize() ?? 'No especificado'}'),
          Text(
              'Objetivo de Peso: ${_selectedWeightChangeGoal?.toShortString().capitalize() ?? 'No especificado'}'),
          if (_selectedWeightChangeGoal != WeightChangeGoal.maintain)
            Text('Peso Objetivo: ${_goalWeightController.text} kg'),
          Text(
              'Velocidad de cambio: ${_selectedWeightChangeSpeed?.toShortString().capitalize() ?? 'No especificado'}'),
          const SizedBox(height: 20),
          const Text('Pulsa "Finalizar" para guardar y continuar.',
              style: TextStyle(fontStyle: FontStyle.italic)),
        ],
      ),
    );
  }
}

class GenderSelectionChips extends StatelessWidget {
  final Gender? selectedGender;
  final Function(Gender) onSelect;

  const GenderSelectionChips({
    super.key,
    required this.selectedGender,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Género:', style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          children: Gender.values.map((gender) {
            return ChoiceChip(
              label: Text(gender.toShortString().capitalize()),
              selected: selectedGender == gender,
              onSelected: (selected) {
                if (selected) {
                  onSelect(gender);
                }
              },
              selectedColor: Colors.blueAccent,
              labelStyle: TextStyle(
                color: selectedGender == gender ? Colors.white : Colors.black,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class ActivityLevelChips extends StatelessWidget {
  final ActivityLevel? selectedActivityLevel;
  final Function(ActivityLevel) onSelect;

  const ActivityLevelChips({
    super.key,
    required this.selectedActivityLevel,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Nivel de Actividad:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: ActivityLevel.values.map((level) {
            return ChoiceChip(
              label: Text(level.toShortString().capitalize()),
              selected: selectedActivityLevel == level,
              onSelected: (selected) {
                if (selected) {
                  onSelect(level);
                }
              },
              selectedColor: Colors.blueAccent,
              labelStyle: TextStyle(
                color: selectedActivityLevel == level
                    ? Colors.white
                    : Colors.black,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class WeightChangeGoalChips extends StatelessWidget {
  final WeightChangeGoal? selectedGoal;
  final Function(WeightChangeGoal) onSelect;

  const WeightChangeGoalChips({
    super.key,
    required this.selectedGoal,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Objetivo de Cambio de Peso:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: WeightChangeGoal.values.map((goal) {
            return ChoiceChip(
              label: Text(goal.toShortString().capitalize()),
              selected: selectedGoal == goal,
              onSelected: (selected) {
                if (selected) {
                  onSelect(goal);
                }
              },
              selectedColor: Colors.blueAccent,
              labelStyle: TextStyle(
                color: selectedGoal == goal ? Colors.white : Colors.black,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

class WeightChangeSpeedChips extends StatelessWidget {
  final WeightChangeSpeed? currentSpeed;
  final Function(WeightChangeSpeed) onSelect;

  const WeightChangeSpeedChips({
    super.key,
    required this.currentSpeed,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Velocidad de Cambio de Peso:',
            style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8.0,
          runSpacing: 4.0,
          children: WeightChangeSpeed.values.map((speed) {
            return ChoiceChip(
              label: Text(speed.toShortString().capitalize()),
              selected: currentSpeed == speed,
              onSelected: (selected) {
                if (selected) {
                  onSelect(speed);
                }
              },
              selectedColor: Colors.blueAccent,
              labelStyle: TextStyle(
                color: currentSpeed == speed ? Colors.white : Colors.black,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

extension EnumExtension on Enum {
  String toShortString() {
    return toString().split('.').last;
  }
}

extension StringCasingExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
