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

  const NutritionQuestionnaireDataEntity({
    this.dietaryType,
    this.dietFocus,
    this.mealsPerDay,
    this.allergies = const [],
    this.likedFoods = const [],
    this.dislikedFoods = const [],
    this.dietaryRestrictions = const [],
  });

  factory NutritionQuestionnaireDataEntity.fromMap(Map<String, dynamic> map) {
    return NutritionQuestionnaireDataEntity(
      dietaryType: dietaryTypeFromString(map['dietary_type']),
      dietFocus: dietFocusFromString(map['diet_focus']),
      mealsPerDay: map['meals_per_day'] as int?,
      allergies: List<String>.from(map['allergies'] ?? []),
      likedFoods: List<String>.from(map['liked_foods'] ?? []),
      dislikedFoods: List<String>.from(map['disliked_foods'] ?? []),
      dietaryRestrictions: List<String>.from(map['dietary_restrictions'] ?? []),
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
      ];
}
