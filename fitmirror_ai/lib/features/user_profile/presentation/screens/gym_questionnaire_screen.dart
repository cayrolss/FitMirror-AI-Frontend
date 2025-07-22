// lib/features/user_profile/presentation/screens/gym_questionnaire_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart'; // Para navegar con GoRouter
// Importa tu controlador para el cuestionario de gimnasio
import 'package:fitmirror_ai/features/user_profile/presentation/providers/gym_questionnaire_controller.dart'; // Asegúrate de tenerlo importado
// Importa el provider del perfil de usuario para actualizar el paso
import 'package:fitmirror_ai/features/user_profile/presentation/providers/user_profile_providers.dart'; // Ya está aquí, pero ahora contendrá el nuevo notifier

class GymQuestionnaireScreen extends ConsumerStatefulWidget {
  const GymQuestionnaireScreen({super.key});

  @override
  ConsumerState<GymQuestionnaireScreen> createState() =>
      _GymQuestionnaireScreenState();
}

class _GymQuestionnaireScreenState
    extends ConsumerState<GymQuestionnaireScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages =
      3; // ASUMIDO: Número total de páginas para Gym Questionnaire

  @override
  void initState() {
    super.initState();
  }

  void _nextPage() {
    if (_currentPage < _totalPages - 1) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentPage++;
      });
    } else {
      // Última página del cuestionario de gimnasio
      _handleFinishGymQuestionnaire();
    }
  }

  void _previousPage() {
    if (_currentPage > 0) {
      _pageController.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
      setState(() {
        _currentPage--;
      });
    } else {
      // Si estamos en la primera página y damos atrás, podríamos volver al Main Questionnaire
      if (context.mounted) {
        context.go(
            '/main-questionnaire'); // O el comportamiento que desees al ir hacia atrás desde la primera página
      }
    }
  }

  Future<void> _handleFinishGymQuestionnaire() async {
    // 1. Guardar los datos específicos del cuestionario de gimnasio
    // Asegúrate de que gymQuestionnaireControllerProvider esté definido y descomentado en tus imports
    // final gymController = ref.read(gymQuestionnaireControllerProvider.notifier);
    // await gymController.saveGymQuestionnaireData(); // Llama a tu método de guardar

    // 2. Actualizar el paso del cuestionario en el perfil completo del usuario
    // ¡CORREGIDO AQUÍ! Usamos userProfileNotifierProvider
    final userProfileNotifier = ref.read(userProfileNotifierProvider.notifier);

    try {
      // Suponemos que ya has guardado los datos de gym a través de su controlador correspondiente
      // Ahora actualiza el paso del cuestionario a 'nutrition' en el perfil completo del usuario
      await userProfileNotifier.updateQuestionnaireStep(
          'nutrition'); // Asegúrate de que este método existe en tu Notifier

      print(
          'Gym Questionnaire completed and saved! Navigating to Nutrition Questionnaire.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cuestionario de Gimnasio Completado!')),
      );

      if (context.mounted) {
        context.go('/nutrition-questionnaire'); // Navega a la siguiente fase
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar o actualizar paso: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Puedes acceder al estado del controlador de gimnasio si lo necesitas
    // final gymData = ref.watch(gymQuestionnaireControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuestionario de Gimnasio'),
        leading: _currentPage > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _previousPage,
              )
            : null,
        actions: [
          TextButton(
            onPressed: () {
              // Si el usuario quiere saltar el cuestionario de gym, aunque no recomendado
              // Deberías decidir si permitir esto o forzar la completación
              // context.go('/nutrition-questionnaire');
            },
            child: const Text('Saltar'), // O remover si es obligatorio
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              physics:
                  const NeverScrollableScrollPhysics(), // Evita deslizar manualmente
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: const [
                // TODO: Reemplaza estos con tus widgets de preguntas de gimnasio
                Center(child: Text('Página 1: Pregunta de Gimnasio')),
                Center(child: Text('Página 2: Pregunta de Gimnasio')),
                Center(child: Text('Página 3: Pregunta de Gimnasio')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage >
                    0) // No mostrar "Anterior" en la primera página
                  ElevatedButton(
                    onPressed: _previousPage,
                    child: const Text('Anterior'),
                  ),
                const Spacer(), // Espacio entre botones
                ElevatedButton(
                  onPressed: _nextPage,
                  child: Text(_currentPage == _totalPages - 1
                      ? 'Finalizar Gimnasio'
                      : 'Siguiente'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
