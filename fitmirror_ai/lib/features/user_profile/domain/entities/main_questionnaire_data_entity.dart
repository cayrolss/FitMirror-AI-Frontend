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

  const MainQuestionnaireDataEntity({
    required this.goal,
    required this.gender,
    required this.age,
    required this.heightCm,
    required this.weightKg,
    this.goalWeightKg,
    this.weightChangeSpeed,
  });

  // NUEVO: Método copyWith para MainQuestionnaireDataEntity
  MainQuestionnaireDataEntity copyWith({
    Goal? goal,
    Gender? gender,
    int? age,
    int? heightCm,
    double? weightKg,
    double? goalWeightKg,
    WeightChangeSpeed? weightChangeSpeed,
  }) {
    return MainQuestionnaireDataEntity(
      goal: goal ?? this.goal,
      gender: gender ?? this.gender,
      age: age ?? this.age,
      heightCm: heightCm ?? this.heightCm,
      weightKg: weightKg ?? this.weightKg,
      goalWeightKg: goalWeightKg ?? this.goalWeightKg,
      weightChangeSpeed: weightChangeSpeed ?? this.weightChangeSpeed,
    );
  }

  factory MainQuestionnaireDataEntity.fromMap(Map<String, dynamic> map) {
    return MainQuestionnaireDataEntity(
      goal: goalFromString(map['goal']) ??
          Goal.maintainWeight, // Default si no se encuentra
      gender: genderFromString(map['gender']) ??
          Gender.other, // Default si no se encuentra
      age: map['age'] as int,
      heightCm: map['height_cm'] as int,
      weightKg: (map['weight_kg'] as num).toDouble(),
      goalWeightKg: (map['goal_weight_kg'] as num?)?.toDouble(),
      weightChangeSpeed:
          weightChangeSpeedFromString(map['weight_change_speed']),
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
      ];
}
