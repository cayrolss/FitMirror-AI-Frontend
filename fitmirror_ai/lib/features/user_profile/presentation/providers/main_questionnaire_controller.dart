// lib/features/user_profile/presentation/providers/main_questionnaire_controller.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/complete_user_profile_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/main_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/repositories/user_profile_repository.dart';
import 'package:fitmirror_ai/features/auth/domain/repositories/auth_repository.dart'; // USERID
import 'package:fitmirror_ai/core/enums.dart'; // ENUMS

import 'package:fitmirror_ai/features/auth/presentation/providers/auth_providers.dart';
import 'package:fitmirror_ai/features/user_profile/presentation/providers/user_profile_providers.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/gym_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/nutrition_questionnaire_data_entity.dart';

part 'main_questionnaire_controller.g.dart';

@riverpod
class MainQuestionnaireController extends _$MainQuestionnaireController {
  MainQuestionnaireController();

  late final UserProfileRepository _userProfileRepository =
      ref.read(userProfileRepositoryProvider);
  late final AuthRepository _authRepository = ref.read(authRepositoryProvider);

  @override
  // El estado inicial será un MainQuestionnaireDataEntity con valores por defecto
  MainQuestionnaireDataEntity build() {
    return const MainQuestionnaireDataEntity(
      goal: Goal.generalHealth,
      gender: Gender.other,
      age: 0, // Se actualizará
      heightCm: 0, // Se actualizará
      weightKg: 0.0, // Se actualizará
      goalWeightKg: null, // Puede ser nulo por defecto
      weightChangeSpeed: null, // Puede ser nulo por defecto
      activityLevel: null, // Añadido
    );
  }

  // Método para actualizar un campo específico del MainQuestionnaireDataEntity
  void updateField<T>(String fieldName, T value) {
    state = state.copyWith(
      // Se usarán los nombres de campo exactos de MainQuestionnaireDataEntity
      goal: fieldName == 'goal' ? value as Goal : state.goal,
      gender: fieldName == 'gender' ? value as Gender : state.gender,
      age: fieldName == 'age' ? value as int : state.age,
      heightCm: fieldName == 'heightCm' ? value as int : state.heightCm,
      weightKg: fieldName == 'weightKg' ? value as double : state.weightKg,
      goalWeightKg:
          fieldName == 'goalWeightKg' ? value as double? : state.goalWeightKg,
      weightChangeSpeed: fieldName == 'weightChangeSpeed'
          ? value as WeightChangeSpeed?
          : state.weightChangeSpeed,
      activityLevel: fieldName == 'activityLevel' // Añadido
          ? value as ActivityLevel?
          : state.activityLevel,
    );
  }

  // ¡CORREGIDO AQUÍ! Ahora acepta MainQuestionnaireDataEntity como argumento
  Future<void> saveMainQuestionnaireData(
      MainQuestionnaireDataEntity data) async {
    final userId = _authRepository.currentUser?.uid;
    if (userId == null) {
      throw Exception('Usuario no autenticado para guardar el perfil.');
    }

    try {
      // Obtener el perfil completo existente o crear uno nuevo si no existe
      CompleteUserProfileEntity? currentProfile =
          await _userProfileRepository.getUserProfile(userId);

      if (currentProfile == null) {
        // Esto no debería ocurrir si ya creamos un perfil inicial en el registro,
        // pero es un buen fallback.
        currentProfile = CompleteUserProfileEntity(
          uid: userId, // ¡CORREGIDO! Cambiado de userId a uid (líneas 76/77)
          username:
              '', // El username debería obtenerse de otro lado o ser un campo de la primera pantalla
          mainQuestionnaire: data, // ¡Usa los datos pasados como argumento!
          gymQuestionnaire:
              GymQuestionnaireDataEntity.empty(), // Usa el empty factory
          nutritionQuestionnaire:
              NutritionQuestionnaireDataEntity.empty(), // Usa el empty factory
          preferredExercises: const [],
          dislikedExercises: const [],
          injuries: const [],
          preferredLanguage: 'es',
          questionnaireStep: 'initial',
          onboardingCompleted: false,
        );
      } else {
        // Actualizar solo el mainQuestionnaire del perfil existente
        currentProfile = currentProfile.copyWith(
          mainQuestionnaire: data, // ¡Usa los datos pasados como argumento!
        );
      }

      // Guardar el perfil completo actualizado en Firestore
      await _userProfileRepository.saveUserProfile(currentProfile);

      print('Main Questionnaire data saved successfully!');
    } catch (e) {
      print('Error saving Main Questionnaire data: $e');
      rethrow; // Propaga el error para que la UI pueda manejarlo
    }
  }

  // Método para actualizar el username (no es parte directa de MainQuestionnaireDataEntity en el backend,
  // pero sí del CompleteUserProfileEntity en Dart)
  Future<void> updateUsername(String username) async {
    final userId = _authRepository.currentUser?.uid;
    if (userId == null) {
      throw Exception(
          'Usuario no autenticado para actualizar el nombre de usuario.');
    }

    try {
      CompleteUserProfileEntity? currentProfile =
          await _userProfileRepository.getUserProfile(userId);
      if (currentProfile != null) {
        currentProfile = currentProfile.copyWith(username: username);
        await _userProfileRepository.saveUserProfile(currentProfile);
      }
    } catch (e) {
      print('Error updating username: $e');
      rethrow;
    }
  }
}
