// lib/features/user_profile/presentation/providers/gym_questionnaire_controller.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/gym_questionnaire_data_entity.dart'; // Importa la entidad de datos de gimnasio
import 'package:fitmirror_ai/features/user_profile/domain/repositories/user_profile_repository.dart'; // Importa el repositorio
import 'package:fitmirror_ai/features/user_profile/presentation/providers/user_profile_providers.dart'; // Para acceder a userProfileRepositoryProvider
import 'package:fitmirror_ai/features/auth/presentation/providers/auth_providers.dart'; // Necesario para authStreamProvider
import 'package:fitmirror_ai/core/enums.dart'; // Para los enums como WorkoutPlace, CardioType, MuscleGroupFocus
part 'gym_questionnaire_controller.g.dart';

@riverpod
class GymQuestionnaireController extends _$GymQuestionnaireController {
  late final UserProfileRepository _userProfileRepository;

  @override
  FutureOr<GymQuestionnaireDataEntity> build() async {
    _userProfileRepository = ref.read(userProfileRepositoryProvider);
    final String? uid =
        ref.read(authStateChangesProvider).value?.uid; // Usa 'uid' aquí

    if (uid != null) {
      // Intentar cargar el perfil del usuario para obtener los datos existentes
      final profile = await _userProfileRepository.getUserProfile(uid);
      // Si hay datos de gym, los usa; si no, inicializa con empty()
      return profile?.gymQuestionnaire ?? GymQuestionnaireDataEntity.empty();
    }
    // Si no hay UID o perfil, devuelve una entidad vacía por defecto
    return GymQuestionnaireDataEntity.empty();
  }

  // Método para actualizar un campo específico del cuestionario de gimnasio
  void updateField<T>(GymQuestionnaireField field, T value) {
    state.whenData((currentData) {
      GymQuestionnaireDataEntity updatedData = currentData;

      switch (field) {
        case GymQuestionnaireField.workoutPlace:
          updatedData = updatedData.copyWith(
              workoutPlace: value as WorkoutPlace); // Casteo a enum
          break;
        case GymQuestionnaireField.exerciseFrequency: // Nombre corregido
          updatedData = updatedData.copyWith(exerciseFrequency: value as int);
          break;
        case GymQuestionnaireField.muscleGroupFocus: // Nombre corregido
          updatedData = updatedData.copyWith(
              muscleGroupFocus:
                  value as List<MuscleGroupFocus>); // Casteo a List<enum>
          break;
        case GymQuestionnaireField.weeklyTrainings: // Nombre corregido
          updatedData = updatedData.copyWith(weeklyTrainings: value as int);
          break;
        case GymQuestionnaireField.cardioType:
          updatedData = updatedData.copyWith(
              cardioType: value as CardioType); // Casteo a enum
          break;
        case GymQuestionnaireField.cardioFrequency:
          updatedData = updatedData.copyWith(cardioFrequency: value as int);
          break;
        // Los campos como workoutExperience, workoutDurationMinutes, favoriteMuscleGroups,
        // dislikedMuscleGroups, equipmentAvailability, workoutGoals YA NO ESTÁN AQUÍ
        // ya que los quitaste de la entidad GymQuestionnaireDataEntity.
      }
      state = AsyncData(updatedData);
    });
  }

  // Método para guardar los datos del cuestionario de gimnasio en el repositorio
  Future<void> saveGymQuestionnaireData() async {
    state = const AsyncLoading(); // Opcional: muestra un estado de carga
    final String? uid = ref.read(authStateChangesProvider).value?.uid;

    if (uid == null) {
      state = AsyncError(
          'Usuario no autenticado para guardar datos de gimnasio.',
          StackTrace.current);
      return;
    }

    try {
      await state.whenData((data) async {
        await _userProfileRepository.saveGymQuestionnaireData(uid, data);
        print('Gym Questionnaire data saved for UID: $uid');
        // Vuelve al estado cargado con los datos actualizados después de guardar
        state = AsyncData(data);
      });
    } catch (e, st) {
      state = AsyncError('Error al guardar datos de gimnasio: $e', st);
      print('Error saving gym questionnaire data: $e');
    }
  }
}

// Enum para identificar los campos del cuestionario de gimnasio (ajusta según tu entidad actual)
enum GymQuestionnaireField {
  workoutPlace,
  exerciseFrequency, // Nombre corregido
  muscleGroupFocus, // Nombre corregido
  weeklyTrainings, // Nombre corregido
  cardioType,
  cardioFrequency,
  // Los otros campos que mencionaste no están en la entidad actual.
}
