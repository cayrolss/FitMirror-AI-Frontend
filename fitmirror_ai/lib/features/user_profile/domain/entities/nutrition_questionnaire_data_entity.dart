// lib/features/user_profile/domain/entities/nutrition_questionnaire_data_entity.dart

import 'package:equatable/equatable.dart';
import '../../../../core/enums.dart'; // Asegúrate de que la ruta sea correcta

class NutritionQuestionnaireDataEntity extends Equatable {
  final DietaryType? dietaryType;
  final DietFocus? dietFocus;
  final int? mealsPerDay;
  final List<String> allergies;
  final List<String> likedFoods;
  final List<String> dislikedFoods;
  final List<String> dietaryRestrictions;
  // Si tienes más campos en tu modelo Python o los usarás en el futuro, agrégalos aquí:
  // final String? typicalBreakfast;
  // final String? typicalLunch;
  // final String? typicalDinner;
  // final String? snackPreference;
  // final double? hydrationLiters;

  const NutritionQuestionnaireDataEntity({
    this.dietaryType,
    this.dietFocus,
    this.mealsPerDay,
    this.allergies = const [],
    this.likedFoods = const [],
    this.dislikedFoods = const [],
    this.dietaryRestrictions = const [],
    // Inicializa los campos adicionales aquí si los agregas
    // this.typicalBreakfast,
    // this.typicalLunch,
    // this.typicalDinner,
    // this.snackPreference,
    // this.hydrationLiters,
  });

  // Factory constructor para un objeto vacío/inicial
  factory NutritionQuestionnaireDataEntity.empty() {
    return const NutritionQuestionnaireDataEntity(
      dietaryType: DietaryType.standard, // Valor por defecto
      dietFocus: DietFocus.balanced, // Valor por defecto
      mealsPerDay: 0, // Valor por defecto
      allergies: [],
      likedFoods: [],
      dislikedFoods: [],
      dietaryRestrictions: [],
      // Valores por defecto para campos adicionales
      // typicalBreakfast: '',
      // typicalLunch: '',
      // typicalDinner: '',
      // snackPreference: '',
      // hydrationLiters: 0.0,
    );
  }

  // Método copyWith actualizado
  NutritionQuestionnaireDataEntity copyWith({
    DietaryType? dietaryType,
    DietFocus? dietFocus,
    int? mealsPerDay,
    List<String>? allergies,
    List<String>? likedFoods,
    List<String>? dislikedFoods,
    List<String>? dietaryRestrictions,
    // Campos adicionales en copyWith
    // String? typicalBreakfast,
    // String? typicalLunch,
    // String? typicalDinner,
    // String? snackPreference,
    // double? hydrationLiters,
  }) {
    return NutritionQuestionnaireDataEntity(
      dietaryType: dietaryType ?? this.dietaryType,
      dietFocus: dietFocus ?? this.dietFocus,
      mealsPerDay: mealsPerDay ?? this.mealsPerDay,
      allergies: allergies ?? this.allergies,
      likedFoods: likedFoods ?? this.likedFoods,
      dislikedFoods: dislikedFoods ?? this.dislikedFoods,
      dietaryRestrictions: dietaryRestrictions ?? this.dietaryRestrictions,
      // Asignación de campos adicionales
      // typicalBreakfast: typicalBreakfast ?? this.typicalBreakfast,
      // typicalLunch: typicalLunch ?? this.typicalLunch,
      // typicalDinner: typicalDinner ?? this.typicalDinner,
      // snackPreference: snackPreference ?? this.snackPreference,
      // hydrationLiters: hydrationLiters ?? this.hydrationLiters,
    );
  }

  factory NutritionQuestionnaireDataEntity.fromMap(Map<String, dynamic> map) {
    return NutritionQuestionnaireDataEntity(
      dietaryType: dietaryTypeFromString(map['dietary_type']),
      dietFocus: dietFocusFromString(map['diet_focus']),
      mealsPerDay: map['meals_per_day'] as int?,
      allergies: List<String>.from(map['allergies'] ?? []),
      likedFoods: List<String>.from(map['liked_foods'] ?? []),
      dislikedFoods: List<String>.from(map['disliked_foods'] ?? []),
      dietaryRestrictions: List<String>.from(map['dietary_restrictions'] ?? []),
      // Lectura de campos adicionales
      // typicalBreakfast: map['typical_breakfast'] as String?,
      // typicalLunch: map['typical_lunch'] as String?,
      // typicalDinner: map['typical_dinner'] as String?,
      // snackPreference: map['snack_preference'] as String?,
      // hydrationLiters: (map['hydration_liters'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'dietary_type': dietaryType?.toApiString(),
      'diet_focus': dietFocus?.toApiString(),
      'meals_per_day': mealsPerDay,
      'allergies': allergies,
      'liked_foods': likedFoods,
      'disliked_foods': dislikedFoods,
      'dietary_restrictions': dietaryRestrictions,
      // Escritura de campos adicionales
      // 'typical_breakfast': typicalBreakfast,
      // 'typical_lunch': typicalLunch,
      // 'typical_dinner': typicalDinner,
      // 'snack_preference': snackPreference,
      // 'hydration_liters': hydrationLiters,
    };
  }

  @override
  List<Object?> get props => [
        dietaryType,
        dietFocus,
        mealsPerDay,
        allergies,
        likedFoods,
        dislikedFoods,
        dietaryRestrictions,
        // Campos adicionales en props
        // typicalBreakfast,
        // typicalLunch,
        // typicalDinner,
        // snackPreference,
        // hydrationLiters,
      ];
}
