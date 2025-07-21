// lib/features/user_profile/presentation/screens/main_questionnaire_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fitmirror_ai/features/user_profile/presentation/providers/main_questionnaire_controller.dart';
import 'package:fitmirror_ai/core/enums.dart'; // Para los Enums
import 'package:fitmirror_ai/features/user_profile/domain/entities/main_questionnaire_data_entity.dart'; // Necesario para el tipo
import 'package:fitmirror_ai/features/user_profile/domain/entities/complete_user_profile_entity.dart'; // Para obtener el username inicial
import 'package:fitmirror_ai/features/user_profile/presentation/providers/user_profile_providers.dart'; // Para el provider del perfil completo

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

  @override
  void initState() {
    super.initState();
    // Cargar datos iniciales si existen (ej. al volver al cuestionario)
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final currentProfile = ref
          .read(completeUserProfileStreamProvider)
          .value; // Obtener el perfil completo
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

        // Si ya hay datos, el PageView podría ir a la última página completada
        // o determinar el _currentPage basado en los datos existentes.
        // Por simplicidad, empezaremos siempre desde la primera página por ahora.
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
    if (_currentPage < 4) {
      // Asumimos 5 páginas (0-4)
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentPage++;
      });
    } else {
      // Última página, lógica para finalizar o navegar al dashboard
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

  Future<void> _handleFinishQuestionnaire() async {
    // Al finalizar el último paso, el controlador ya debería tener los datos actualizados.
    // Llamamos a save para asegurarnos de que todo está persistido.
    final controller = ref.read(mainQuestionnaireControllerProvider.notifier);
    try {
      await controller.saveMainQuestionnaireData();
      // Aquí puedes navegar a la siguiente sección del onboarding
      // o directamente al dashboard si es el final de todo el onboarding.
      // Por ejemplo: Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => DashboardScreen()));
      print('Main Questionnaire completed and saved!');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cuestionario Principal Completado!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Escucha los cambios en el MainQuestionnaireDataEntity
    final mainQuestionnaireData =
        ref.watch(mainQuestionnaireControllerProvider);

    return Scaffold(
      appBar: AppBar(
        leading: _currentPage > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _previousPage,
              )
            : null,
        title: const Text('Cuestionario Principal'),
        actions: [
          // Barra de progreso simple
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Center(
              child: Text('${_currentPage + 1}/5'),
            ),
          ),
        ],
      ),
      body: PageView(
        controller: _pageController,
        physics:
            const NeverScrollableScrollPhysics(), // Deshabilita el deslizamiento manual
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        children: [
          // Página 1: Nombre de Usuario
          _NameQuestionPage(
            nameController: _nameController,
            onNext: () async {
              if (_nameController.text.isNotEmpty) {
                await ref
                    .read(mainQuestionnaireControllerProvider.notifier)
                    .updateUsername(_nameController.text);
                _nextPage();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text('Por favor, ingresa tu nombre.')),
                );
              }
            },
          ),
          // Página 2: ¿Cuál es tu objetivo?
          _GoalQuestionPage(
            currentGoal: mainQuestionnaireData.goal,
            onSelect: (goal) {
              ref
                  .read(mainQuestionnaireControllerProvider.notifier)
                  .updateField('goal', goal);
              _nextPage();
            },
          ),
          // Página 3: ¿Cuál es tu género?
          _GenderQuestionPage(
            currentGender: mainQuestionnaireData.gender,
            onSelect: (gender) {
              ref
                  .read(mainQuestionnaireControllerProvider.notifier)
                  .updateField('gender', gender);
              _nextPage();
            },
          ),
          // Página 4: Edad y Altura
          _AgeHeightQuestionPage(
            ageController: _ageController,
            heightController: _heightController,
            onNext: () {
              final age = int.tryParse(_ageController.text);
              final height = int.tryParse(_heightController.text);
              if (age != null &&
                  age >= 13 &&
                  age <= 100 &&
                  height != null &&
                  height >= 100 &&
                  height <= 250) {
                ref
                    .read(mainQuestionnaireControllerProvider.notifier)
                    .updateField('age', age);
                ref
                    .read(mainQuestionnaireControllerProvider.notifier)
                    .updateField('heightCm', height);
                _nextPage();
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                          'Por favor, ingresa una edad válida (13-100) y altura (100-250 cm).')),
                );
              }
            },
          ),
          // Página 5: Peso Actual, Peso Objetivo y Velocidad
          _WeightGoalSpeedQuestionPage(
            currentWeightController: _currentWeightController,
            goalWeightController: _goalWeightController,
            currentWeightChangeSpeed: mainQuestionnaireData.weightChangeSpeed,
            onNext: () {
              final currentWeight =
                  double.tryParse(_currentWeightController.text);
              final goalWeight = double.tryParse(_goalWeightController.text);

              if (currentWeight != null &&
                  currentWeight >= 30 &&
                  currentWeight <= 300 &&
                  (goalWeight == null ||
                      (goalWeight >= 30 && goalWeight <= 300))) {
                ref
                    .read(mainQuestionnaireControllerProvider.notifier)
                    .updateField('weightKg', currentWeight);
                ref
                    .read(mainQuestionnaireControllerProvider.notifier)
                    .updateField('goalWeightKg', goalWeight);
                // weightChangeSpeed ya debería estar actualizado por el selector de la UI
                _nextPage(); // Esto llamará a _handleFinishQuestionnaire
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                      content: Text(
                          'Por favor, ingresa un peso actual válido (30-300 kg) y un peso objetivo válido si aplica.')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}

// --- WIDGETS DE PÁGINAS INDIVIDUALES ---

class _NameQuestionPage extends ConsumerWidget {
  final TextEditingController nameController;
  final VoidCallback onNext;

  const _NameQuestionPage({required this.nameController, required this.onNext});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.waving_hand_rounded,
              size: 80, color: Colors.blueAccent),
          const SizedBox(height: 24),
          const Text(
            'Hi! What\'s your name?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          TextField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Write your name here',
              prefixIcon: const Icon(Icons.edit),
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.grey[200],
            ),
            onSubmitted: (_) => onNext(), // Permite avanzar al presionar enter
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Next'),
                Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _GoalQuestionPage extends StatelessWidget {
  final Goal currentGoal;
  final ValueChanged<Goal> onSelect;

  const _GoalQuestionPage({required this.currentGoal, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.flag_rounded, size: 80, color: Colors.blueAccent),
          const SizedBox(height: 24),
          const Text(
            'What is your goal?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          _GoalOptionCard(
            icon: Icons.fitness_center_rounded,
            title: 'Get fitter',
            subtitle: 'Tone up & feel healthy',
            isSelected: currentGoal == Goal.improveFitness,
            onTap: () => onSelect(Goal.improveFitness),
          ),
          const SizedBox(height: 16),
          _GoalOptionCard(
            icon: Icons.arrow_upward_rounded,
            title: 'Build muscle',
            subtitle: 'Gain size and strength',
            isSelected: currentGoal == Goal.gainMuscle,
            onTap: () => onSelect(Goal.gainMuscle),
          ),
          const SizedBox(height: 16),
          _GoalOptionCard(
            icon: Icons.arrow_downward_rounded,
            title: 'Lose weight',
            subtitle: 'Reduce body fat',
            isSelected: currentGoal == Goal.loseWeight,
            onTap: () => onSelect(Goal.loseWeight),
          ),
          const SizedBox(height: 16),
          _GoalOptionCard(
            icon: Icons.bar_chart_rounded,
            title: 'Maintain physique',
            subtitle: 'Optimize your performance',
            isSelected: currentGoal == Goal.maintainWeight,
            onTap: () => onSelect(Goal.maintainWeight),
          ),
        ],
      ),
    );
  }
}

class _GoalOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _GoalOptionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isSelected
            ? const BorderSide(color: Colors.blueAccent, width: 2)
            : BorderSide.none,
      ),
      color: isSelected ? Colors.blueAccent.withOpacity(0.1) : Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon,
                  size: 36,
                  color: isSelected ? Colors.blueAccent : Colors.grey[700]),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.blueAccent : Colors.black,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _GenderQuestionPage extends StatelessWidget {
  final Gender currentGender;
  final ValueChanged<Gender> onSelect;

  const _GenderQuestionPage(
      {required this.currentGender, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person_rounded, size: 80, color: Colors.blueAccent),
          const SizedBox(height: 24),
          const Text(
            'What is your gender?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          _GenderOptionCard(
            icon: Icons.male_rounded,
            title: 'Male',
            subtitle: 'Typically higher calorie needs',
            isSelected: currentGender == Gender.male,
            onTap: () => onSelect(Gender.male),
          ),
          const SizedBox(height: 16),
          _GenderOptionCard(
            icon: Icons.female_rounded,
            title: 'Female',
            subtitle: 'Tailored hormonal balance',
            isSelected: currentGender == Gender.female,
            onTap: () => onSelect(Gender.female),
          ),
          const SizedBox(height: 16),
          _GenderOptionCard(
            icon: Icons.transgender_rounded,
            title: 'Other',
            subtitle: 'We\'ll personalize it for you',
            isSelected: currentGender == Gender.other,
            onTap: () => onSelect(Gender.other),
          ),
        ],
      ),
    );
  }
}

class _GenderOptionCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool isSelected;
  final VoidCallback onTap;

  const _GenderOptionCard({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isSelected ? 4 : 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: isSelected
            ? const BorderSide(color: Colors.blueAccent, width: 2)
            : BorderSide.none,
      ),
      color: isSelected ? Colors.blueAccent.withOpacity(0.1) : Colors.white,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon,
                  size: 36,
                  color: isSelected ? Colors.blueAccent : Colors.grey[700]),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isSelected ? Colors.blueAccent : Colors.black,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AgeHeightQuestionPage extends ConsumerWidget {
  final TextEditingController ageController;
  final TextEditingController heightController;
  final VoidCallback onNext;

  const _AgeHeightQuestionPage({
    required this.ageController,
    required this.heightController,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainQuestionnaireData =
        ref.watch(mainQuestionnaireControllerProvider);

    // Inicializar controladores si los datos ya existen en el estado
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mainQuestionnaireData.age != 0 && ageController.text.isEmpty) {
        ageController.text = mainQuestionnaireData.age.toString();
      }
      if (mainQuestionnaireData.heightCm != 0 &&
          heightController.text.isEmpty) {
        heightController.text = mainQuestionnaireData.heightCm.toString();
      }
    });

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.person_outline, size: 80, color: Colors.blueAccent),
          const SizedBox(height: 24),
          const Text(
            'We need a few details about you',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          _DetailInputCard(
            icon: Icons.calendar_today_rounded,
            title: 'Age',
            value: mainQuestionnaireData.age == 0
                ? ''
                : '${mainQuestionnaireData.age} years',
            onTap: () => _showNumberPicker(
              context,
              ageController,
              'Age',
              13,
              100,
              (value) => ref
                  .read(mainQuestionnaireControllerProvider.notifier)
                  .updateField('age', value),
            ),
          ),
          const SizedBox(height: 16),
          _DetailInputCard(
            icon: Icons.height_rounded,
            title: 'Height',
            value: mainQuestionnaireData.heightCm == 0
                ? ''
                : '${mainQuestionnaireData.heightCm} cm',
            onTap: () => _showNumberPicker(
              context,
              heightController,
              'Height',
              100,
              250,
              (value) => ref
                  .read(mainQuestionnaireControllerProvider.notifier)
                  .updateField('heightCm', value),
            ),
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Next'),
                Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper para mostrar un number picker (ej. para Edad/Altura)
  void _showNumberPicker(BuildContext context, TextEditingController controller,
      String title, int min, int max, ValueChanged<int> onValueSet) {
    int? selectedValue = int.tryParse(controller.text.split(' ')[0]) ??
        min; // Intenta parsear el valor actual

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: Center(
                  child: DropdownButton<int>(
                    value: selectedValue,
                    items: List.generate(max - min + 1, (index) => min + index)
                        .map<DropdownMenuItem<int>>((int value) {
                      return DropdownMenuItem<int>(
                        value: value,
                        child: Text('$value'),
                      );
                    }).toList(),
                    onChanged: (int? newValue) {
                      if (newValue != null) {
                        selectedValue = newValue;
                        controller.text =
                            '$newValue'; // Actualiza el controlador
                        onValueSet(
                            newValue); // Envía el valor al controlador de Riverpod
                        Navigator.pop(context); // Cierra el modal
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _DetailInputCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const _DetailInputCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.grey[100],
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 36, color: Colors.blueAccent),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      value.isNotEmpty ? value : 'Tap to select',
                      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios_rounded,
                  size: 16, color: Colors.grey),
            ],
          ),
        ),
      ),
    );
  }
}

class _WeightGoalSpeedQuestionPage extends ConsumerWidget {
  final TextEditingController currentWeightController;
  final TextEditingController goalWeightController;
  final WeightChangeSpeed? currentWeightChangeSpeed; // Ahora puede ser nulo

  final VoidCallback onNext;

  const _WeightGoalSpeedQuestionPage({
    required this.currentWeightController,
    required this.goalWeightController,
    this.currentWeightChangeSpeed,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainQuestionnaireData =
        ref.watch(mainQuestionnaireControllerProvider);

    // Inicializar controladores si los datos ya existen en el estado
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mainQuestionnaireData.weightKg != 0.0 &&
          currentWeightController.text.isEmpty) {
        currentWeightController.text =
            mainQuestionnaireData.weightKg.toString();
      }
      if (mainQuestionnaireData.goalWeightKg != null &&
          mainQuestionnaireData.goalWeightKg != 0.0 &&
          goalWeightController.text.isEmpty) {
        goalWeightController.text =
            mainQuestionnaireData.goalWeightKg.toString();
      }
    });

    return Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.fitness_center_rounded,
              size: 80, color: Colors.blueAccent),
          const SizedBox(height: 24),
          const Text(
            'Customize your goal',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 48),
          _DetailInputCard(
            icon: Icons.scale_rounded,
            title: 'Current Weight',
            value: mainQuestionnaireData.weightKg == 0.0
                ? ''
                : '${mainQuestionnaireData.weightKg} kg',
            onTap: () => _showDecimalPicker(
              context,
              currentWeightController,
              'Current Weight (kg)',
              30.0,
              300.0,
              (value) => ref
                  .read(mainQuestionnaireControllerProvider.notifier)
                  .updateField('weightKg', value),
            ),
          ),
          const SizedBox(height: 16),
          _DetailInputCard(
            icon: Icons.flag_circle_rounded,
            title: 'Goal Weight',
            value: mainQuestionnaireData.goalWeightKg == null ||
                    mainQuestionnaireData.goalWeightKg == 0.0
                ? ''
                : '${mainQuestionnaireData.goalWeightKg} kg',
            onTap: () => _showDecimalPicker(
              context,
              goalWeightController,
              'Goal Weight (kg)',
              30.0,
              300.0,
              (value) => ref
                  .read(mainQuestionnaireControllerProvider.notifier)
                  .updateField('goalWeightKg', value),
            ),
          ),
          const SizedBox(height: 16),
          _SpeedOptionCard(
            currentSpeed: currentWeightChangeSpeed,
            onSelect: (speed) {
              ref
                  .read(mainQuestionnaireControllerProvider.notifier)
                  .updateField('weightChangeSpeed', speed);
            },
          ),
          const SizedBox(height: 32),
          ElevatedButton(
            onPressed: onNext,
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(double.infinity, 50),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Create your plan'),
                Icon(Icons.arrow_forward_ios_rounded, size: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Helper para mostrar un number picker para valores decimales (ej. para Pesos)
  void _showDecimalPicker(
      BuildContext context,
      TextEditingController controller,
      String title,
      double min,
      double max,
      ValueChanged<double> onValueSet) {
    double? selectedValue = double.tryParse(controller.text) ?? min;

    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 250,
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(title,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: Center(
                  child: DropdownButton<double>(
                    value: selectedValue,
                    items: List.generate(((max - min) * 10).toInt() + 1,
                            (index) => min + (index / 10))
                        .map<DropdownMenuItem<double>>((double value) {
                      return DropdownMenuItem<double>(
                        value: value,
                        child: Text(
                            value.toStringAsFixed(1)), // Mostrar con un decimal
                      );
                    }).toList(),
                    onChanged: (double? newValue) {
                      if (newValue != null) {
                        selectedValue = newValue;
                        controller.text = newValue.toStringAsFixed(1);
                        onValueSet(newValue);
                        Navigator.pop(context);
                      }
                    },
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _SpeedOptionCard extends StatelessWidget {
  final WeightChangeSpeed? currentSpeed;
  final ValueChanged<WeightChangeSpeed> onSelect;

  const _SpeedOptionCard({
    required this.currentSpeed,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.grey[100],
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Speed',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: WeightChangeSpeed.values.map((speed) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    child: ChoiceChip(
                      label: Text(speed
                          .toShortString()
                          .capitalize()), // Necesitarás la extensión .capitalize()
                      selected: currentSpeed == speed,
                      onSelected: (selected) {
                        if (selected) {
                          onSelect(speed);
                        }
                      },
                      selectedColor: Colors.blueAccent,
                      labelStyle: TextStyle(
                        color:
                            currentSpeed == speed ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }
}

// Extensión para obtener strings legibles de los enums
extension EnumExtension on Enum {
  String toShortString() {
    return toString().split('.').last;
  }
}

// Extensión para capitalizar la primera letra (necesaria para la UI de los chips)
extension StringCasingExtension on String {
  String capitalize() {
    return '${this[0].toUpperCase()}${substring(1).toLowerCase()}';
  }
}
