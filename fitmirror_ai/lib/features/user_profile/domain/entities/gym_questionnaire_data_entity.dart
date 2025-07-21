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
  final List<String> preferredExercises; // NUEVO
  final List<String> dislikedExercises; // NUEVO
  final List<String> injuries; // NUEVO

  const GymQuestionnaireDataEntity({
    required this.workoutPlace,
    required this.exerciseFrequency,
    required this.muscleGroupFocus,
    required this.weeklyTrainings,
    required this.cardioType,
    required this.cardioFrequency,
    this.preferredExercises = const [], // NUEVO: valor por defecto
    this.dislikedExercises = const [], // NUEVO: valor por defecto
    this.injuries = const [], // NUEVO: valor por defecto
  });

  // Método copyWith actualizado
  GymQuestionnaireDataEntity copyWith({
    WorkoutPlace? workoutPlace,
    int? exerciseFrequency,
    List<MuscleGroupFocus>? muscleGroupFocus,
    int? weeklyTrainings,
    CardioType? cardioType,
    int? cardioFrequency,
    List<String>? preferredExercises,
    List<String>? dislikedExercises,
    List<String>? injuries,
  }) {
    return GymQuestionnaireDataEntity(
      workoutPlace: workoutPlace ?? this.workoutPlace,
      exerciseFrequency: exerciseFrequency ?? this.exerciseFrequency,
      muscleGroupFocus: muscleGroupFocus ?? this.muscleGroupFocus,
      weeklyTrainings: weeklyTrainings ?? this.weeklyTrainings,
      cardioType: cardioType ?? this.cardioType,
      cardioFrequency: cardioFrequency ?? this.cardioFrequency,
      preferredExercises: preferredExercises ?? this.preferredExercises,
      dislikedExercises: dislikedExercises ?? this.dislikedExercises,
      injuries: injuries ?? this.injuries,
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
      preferredExercises:
          List<String>.from(map['preferred_exercises'] as List? ?? []), // NUEVO
      dislikedExercises:
          List<String>.from(map['disliked_exercises'] as List? ?? []), // NUEVO
      injuries: List<String>.from(map['injuries'] as List? ?? []), // NUEVO
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
      'preferred_exercises': preferredExercises, // NUEVO
      'disliked_exercises': dislikedExercises, // NUEVO
      'injuries': injuries, // NUEVO
    };
  }

  @override
  List<Object?> get props => [
        workoutPlace,
        exerciseFrequency,
        muscleGroupFocus,
        weeklyTrainings,
        cardioType,
        cardioFrequency,
        preferredExercises, // NUEVO
        dislikedExercises, // NUEVO
        injuries, // NUEVO
      ];
}
