// lib/features/user_profile/presentation/screens/nutrition_questionnaire_screen.dart

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart'; // Para navegar con GoRouter
import 'package:firebase_auth/firebase_auth.dart'; // ¡AÑADIDO! Para obtener el UID del usuario
// Importa tu controlador para el cuestionario de nutrición
import 'package:fitmirror_ai/features/user_profile/presentation/providers/nutrition_questionnaire_controller.dart'; // Asegúrate de tenerlo importado
// Importa el provider del perfil de usuario para actualizar el paso
import 'package:fitmirror_ai/features/user_profile/presentation/providers/user_profile_providers.dart'; // Ya está aquí, pero ahora contendrá el nuevo notifier

class NutritionQuestionnaireScreen extends ConsumerStatefulWidget {
  const NutritionQuestionnaireScreen({super.key});

  @override
  ConsumerState<NutritionQuestionnaireScreen> createState() =>
      _NutritionQuestionnaireScreenState();
}

class _NutritionQuestionnaireScreenState
    extends ConsumerState<NutritionQuestionnaireScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  final int _totalPages =
      2; // ASUMIDO: Número total de páginas para Nutrition Questionnaire (ej. incluye Allergies)

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
      // Última página del cuestionario de nutrición
      _handleFinishNutritionQuestionnaire();
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
      // Si estamos en la primera página y damos atrás, volvemos al Gym Questionnaire
      if (context.mounted) {
        context.go('/gym-questionnaire'); // O el comportamiento que desees
      }
    }
  }

  Future<void> _handleFinishNutritionQuestionnaire() async {
    // 1. Guardar los datos específicos del cuestionario de nutrición
    final nutritionController =
        ref.read(nutritionQuestionnaireControllerProvider.notifier);
    final user = FirebaseAuth.instance.currentUser; // Obtener el usuario actual

    if (user == null) {
      print(
          'Error: Usuario no logueado al finalizar el cuestionario de nutrición.');
      // Mostrar un mensaje de error al usuario si es necesario
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text(
                'Error: No se pudo guardar el cuestionario. Inicia sesión.')),
      );
      return;
    }

    try {
      // Llama a tu método de guardar los datos del cuestionario de nutrición
      await nutritionController.saveNutritionQuestionnaireData();

      // 2. Actualizar el perfil del usuario (onboarding completado y paso del cuestionario)
      final userProfileNotifier =
          ref.read(userProfileNotifierProvider.notifier);

      // ¡CORREGIDO AQUÍ! Pasa el UID del usuario como primer argumento
      await userProfileNotifier.updateOnboardingCompleted(
          user.uid, true); // Método para marcar como completado
      await userProfileNotifier.updateQuestionnaireStep(user.uid,
          'completed'); // O null, según tu preferencia para el estado final

      print(
          'Nutrition Questionnaire completed! Onboarding finished. Navigating to Home.');
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cuestionario de Nutrición Completado!')),
      );

      if (context.mounted) {
        context.go('/'); // Navega a la pantalla principal de la aplicación
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error al guardar o finalizar onboarding: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Aquí puedes acceder al estado del controlador de nutrición si lo necesitas
    // final nutritionData = ref.watch(nutritionQuestionnaireControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cuestionario de Nutrición'),
        leading: _currentPage > 0
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: _previousPage,
              )
            : null,
        actions: [
          TextButton(
            onPressed: () {
              // Si el usuario quiere saltar el cuestionario de nutrición
              // context.go('/');
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
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              children: const [
                // TODO: Reemplaza estos con tus widgets de preguntas de nutrición
                Center(
                    child:
                        Text('Página 1: Pregunta de Nutrición (ej. Alergias)')),
                Center(child: Text('Página 2: Pregunta de Nutrición')),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentPage > 0)
                  ElevatedButton(
                    onPressed: _previousPage,
                    child: const Text('Anterior'),
                  ),
                const Spacer(),
                ElevatedButton(
                  onPressed: _nextPage,
                  child: Text(_currentPage == _totalPages - 1
                      ? 'Finalizar Onboarding'
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
