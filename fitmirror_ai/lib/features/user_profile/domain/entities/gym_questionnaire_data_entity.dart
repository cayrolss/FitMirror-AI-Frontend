// lib/features/user_profile/domain/entities/gym_questionnaire_data_entity.dart

import 'package:equatable/equatable.dart';
import 'package:fitmirror_ai/core/enums.dart'; // Asegúrate de que tus enums están aquí

class GymQuestionnaireDataEntity extends Equatable {
  final WorkoutPlace workoutPlace;
  final int exerciseFrequency; // Días a la semana
  final List<MuscleGroupFocus> muscleGroupFocus;
  final int weeklyTrainings; // Sesiones a la semana
  final CardioType cardioType;
  final int cardioFrequency; // Días a la semana
  // preferredExercises, dislikedExercises, injuries HAN SIDO MOVIDOS a CompleteUserProfileEntity

  const GymQuestionnaireDataEntity({
    required this.workoutPlace,
    required this.exerciseFrequency,
    required this.muscleGroupFocus,
    required this.weeklyTrainings,
    required this.cardioType,
    required this.cardioFrequency,
  });

  // Método copyWith actualizado
  GymQuestionnaireDataEntity copyWith({
    WorkoutPlace? workoutPlace,
    int? exerciseFrequency,
    List<MuscleGroupFocus>? muscleGroupFocus,
    int? weeklyTrainings,
    CardioType? cardioType,
    int? cardioFrequency,
  }) {
    return GymQuestionnaireDataEntity(
      workoutPlace: workoutPlace ?? this.workoutPlace,
      exerciseFrequency: exerciseFrequency ?? this.exerciseFrequency,
      muscleGroupFocus: muscleGroupFocus ?? this.muscleGroupFocus,
      weeklyTrainings: weeklyTrainings ?? this.weeklyTrainings,
      cardioType: cardioType ?? this.cardioType,
      cardioFrequency: cardioFrequency ?? this.cardioFrequency,
    );
  }

  factory GymQuestionnaireDataEntity.fromMap(Map<String, dynamic> map) {
    return GymQuestionnaireDataEntity(
      workoutPlace:
          workoutPlaceFromString(map['workout_place']) ?? WorkoutPlace.home,
      exerciseFrequency: map['exercise_frequency'] as int,
      muscleGroupFocus: (map['muscle_group_focus'] as List<dynamic>?)
              ?.map((e) => muscleGroupFocusFromString(e)!)
              .whereType<MuscleGroupFocus>() // Filtra nulos si hay
              .toList() ??
          [],
      weeklyTrainings: map['weekly_trainings'] as int,
      cardioType: cardioTypeFromString(map['cardio_type']) ?? CardioType.none,
      cardioFrequency: map['cardio_frequency'] as int,
      // preferredExercises, dislikedExercises, injuries YA NO SE LEEN AQUÍ
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'workout_place': workoutPlace.toApiString(),
      'exercise_frequency': exerciseFrequency,
      'muscle_group_focus':
          muscleGroupFocus.map((e) => e.toApiString()).toList(),
      'weekly_trainings': weeklyTrainings,
      'cardio_type': cardioType.toApiString(),
      'cardio_frequency': cardioFrequency,
      // preferred_exercises, disliked_exercises, injuries YA NO SE ESCRIBEN AQUÍ
    };
  }

  factory GymQuestionnaireDataEntity.empty() {
    return const GymQuestionnaireDataEntity(
      workoutPlace: WorkoutPlace.home, // Valor por defecto
      exerciseFrequency: 0, // Valor por defecto
      muscleGroupFocus: [], // Lista vacía por defecto
      weeklyTrainings: 0, // Valor por defecto
      cardioType: CardioType.none, // Valor por defecto
      cardioFrequency: 0, // Valor por defecto
    );
  }
  @override
  List<Object?> get props => [
        workoutPlace,
        exerciseFrequency,
        muscleGroupFocus,
        weeklyTrainings,
        cardioType,
        cardioFrequency,
      ];
}
