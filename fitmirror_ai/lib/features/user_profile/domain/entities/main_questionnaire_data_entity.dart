// lib/features/user_profile/domain/entities/main_questionnaire_data_entity.dart

import 'package:equatable/equatable.dart';
import '../../../../core/enums.dart'; // Asegúrate de que la ruta sea correcta

class MainQuestionnaireDataEntity extends Equatable {
  final Goal goal;
  final Gender gender;
  final int age;
  final int heightCm;
  final double weightKg;
  final double? goalWeightKg;
  final WeightChangeSpeed? weightChangeSpeed;
  final ActivityLevel? activityLevel; // ¡Campo añadido!

  const MainQuestionnaireDataEntity({
    required this.goal,
    required this.gender,
    required this.age,
    required this.heightCm,
    required this.weightKg,
    this.goalWeightKg,
    this.weightChangeSpeed,
    this.activityLevel, // ¡Parámetro añadido al constructor!
  });

  // Método copyWith para MainQuestionnaireDataEntity
  MainQuestionnaireDataEntity copyWith({
    Goal? goal,
    Gender? gender,
    int? age,
    int? heightCm,
    double? weightKg,
    double? goalWeightKg,
    WeightChangeSpeed? weightChangeSpeed,
    ActivityLevel? activityLevel, // ¡Añadido a copyWith!
  }) {
    return MainQuestionnaireDataEntity(
      goal: goal ?? this.goal,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      goalWeightKg: goalWeightKg ?? this.goalWeightKg,
      weightChangeSpeed: weightChangeSpeed ?? this.weightChangeSpeed,
      activityLevel:
          activityLevel ?? this.activityLevel, // ¡Añadido a copyWith!
    );
  }

  // MÉTODO FACTORY empty() AJUSTADO
  factory MainQuestionnaireDataEntity.empty() {
    return const MainQuestionnaireDataEntity(
      goal: Goal.maintainWeight, // Valor por defecto
      gender: Gender.other, // Valor por defecto
      age: 0, // Valor inicial
      heightCm: 0, // Valor inicial
      weightKg: 0.0, // Valor inicial
      goalWeightKg: null, // Campo opcional
      weightChangeSpeed: null, // Campo opcional
      activityLevel: null, // ¡Valor por defecto añadido!
    );
  }

  factory MainQuestionnaireDataEntity.fromMap(Map<String, dynamic> map) {
    return MainQuestionnaireDataEntity(
      goal: goalFromString(map['goal']) ?? Goal.maintainWeight,
      gender: genderFromString(map['gender']) ?? Gender.other,
      age: map['age'] as int,
      heightCm: map['height_cm'] as int,
      weightKg: (map['weight_kg'] as num).toDouble(),
      goalWeightKg: (map['goal_weight_kg'] as num?)?.toDouble(),
      weightChangeSpeed:
          weightChangeSpeedFromString(map['weight_change_speed']),
      activityLevel:
          activityLevelFromString(map['activity_level']), // ¡Añadido a fromMap!
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'goal': goal.toApiString(),
      'gender': gender.toApiString(),
      'age': age,
      'height_cm': heightCm,
      'weight_kg': weightKg,
      'goal_weight_kg': goalWeightKg,
      'weight_change_speed': weightChangeSpeed?.toApiString(),
      'activity_level': activityLevel?.toApiString(), // ¡Añadido a toMap!
    };
  }

  @override
  List<Object?> get props => [
        goal,
        gender,
        age,
        heightCm,
        weightKg,
        goalWeightKg,
        weightChangeSpeed,
        activityLevel, // ¡Añadido a props!
      ];
}
