// lib/features/user_profile/presentation/providers/nutrition_questionnaire_controller.dart

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/nutrition_questionnaire_data_entity.dart'; // Importa la entidad de datos de nutrición
import 'package:fitmirror_ai/features/user_profile/domain/repositories/user_profile_repository.dart'; // Importa el repositorio
import 'package:fitmirror_ai/features/user_profile/presentation/providers/user_profile_providers.dart'; // Para acceder a userProfileRepositoryProvider
import 'package:fitmirror_ai/features/auth/presentation/providers/auth_providers.dart'; // Necesario para authStateChangesProvider
import 'package:fitmirror_ai/core/enums.dart'; // Para los enums como DietaryType, DietFocus

part 'nutrition_questionnaire_controller.g.dart';

@riverpod
class NutritionQuestionnaireController
    extends _$NutritionQuestionnaireController {
  late final UserProfileRepository _userProfileRepository;

  @override
  FutureOr<NutritionQuestionnaireDataEntity> build() async {
    _userProfileRepository = ref.read(userProfileRepositoryProvider);
    // Podrías intentar cargar datos existentes del cuestionario de nutrición
    final String? uid = ref
        .read(authStateChangesProvider)
        .value
        ?.uid; // CORREGIDO: authStateChangesProvider
    if (uid != null) {
      final profile = await _userProfileRepository.getUserProfile(uid);
      // CORREGIDO: nutritionQuestionnaire en lugar de nutritionQuestionnaireData
      return profile?.nutritionQuestionnaire ??
          NutritionQuestionnaireDataEntity.empty();
    }
    return NutritionQuestionnaireDataEntity.empty();
  }

  // Método para actualizar un campo específico del cuestionario de nutrición
  void updateField<T>(NutritionQuestionnaireField field, T value) {
    state.whenData((currentData) {
      NutritionQuestionnaireDataEntity updatedData = currentData;

      switch (field) {
        case NutritionQuestionnaireField.dietaryType:
          updatedData = updatedData.copyWith(
              dietaryType: value as DietaryType); // CORREGIDO: Casteo a enum
          break;
        case NutritionQuestionnaireField.dietFocus:
          updatedData = updatedData.copyWith(
              dietFocus: value as DietFocus); // CORREGIDO: Casteo a enum
          break;
        case NutritionQuestionnaireField.allergies:
          updatedData = updatedData.copyWith(allergies: value as List<String>);
          break;
        case NutritionQuestionnaireField.foodDislikes:
          updatedData = updatedData.copyWith(
              dislikedFoods: value as List<String>); // CORREGIDO: dislikedFoods
          break;
        case NutritionQuestionnaireField.mealsPerDay:
          updatedData = updatedData.copyWith(
              mealsPerDay: value as int?); // CORREGIDO: int?
          break;
        case NutritionQuestionnaireField.favoriteFoods:
          updatedData = updatedData.copyWith(
              likedFoods: value as List<String>); // CORREGIDO: likedFoods
          break;
        // Si tienes estos campos en tu entidad, descomenta y usa el tipo correcto
        // case NutritionQuestionnaireField.typicalBreakfast:
        //   updatedData = updatedData.copyWith(typicalBreakfast: value as String?);
        //   break;
        // case NutritionQuestionnaireField.typicalLunch:
        //   updatedData = updatedData.copyWith(typicalLunch: value as String?);
        //   break;
        // case NutritionQuestionnaireField.typicalDinner:
        //   updatedData = updatedData.copyWith(typicalDinner: value as String?);
        //   break;
        // case NutritionQuestionnaireField.snackPreference:
        //   updatedData = updatedData.copyWith(snackPreference: value as String?);
        //   break;
        // case NutritionQuestionnaireField.hydrationLiters:
        //   updatedData = updatedData.copyWith(hydrationLiters: value as double?);
        //   break;
        // Agrega más casos para otros campos si los tienes en NutritionQuestionnaireDataEntity
      }
      state = AsyncData(updatedData);
    });
  }

  // Método para guardar los datos del cuestionario de nutrición en el repositorio
  Future<void> saveNutritionQuestionnaireData() async {
    state = const AsyncLoading(); // Opcional: muestra un estado de carga
    final String? uid = ref
        .read(authStateChangesProvider)
        .value
        ?.uid; // CORREGIDO: authStateChangesProvider

    if (uid == null) {
      state = AsyncError(
          'Usuario no autenticado para guardar datos de nutrición.',
          StackTrace.current);
      return;
    }

    try {
      await state.whenData((data) async {
        await _userProfileRepository.saveNutritionQuestionnaireData(uid, data);
        print('Nutrition Questionnaire data saved for UID: $uid');
        state = AsyncData(
            data); // Vuelve al estado cargado con los datos actualizados
      });
    } catch (e, st) {
      state = AsyncError('Error al guardar datos de nutrición: $e', st);
      print('Error saving nutrition questionnaire data: $e');
    }
  }
}

// Enum para identificar los campos del cuestionario de nutrición (ajusta según tu entidad)
enum NutritionQuestionnaireField {
  dietaryType,
  dietFocus,
  allergies,
  foodDislikes, // CORREGIDO
  mealsPerDay,
  favoriteFoods, // CORREGIDO
  // Si tienes estos campos en tu entidad, descomenta y usa el tipo correcto
  // typicalBreakfast,
  // typicalLunch,
  // typicalDinner,
  // snackPreference,
  // hydrationLiters,
  // Agrega más campos si los tienes en NutritionQuestionnaireDataEntity
}
