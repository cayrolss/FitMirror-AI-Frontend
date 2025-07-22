// lib/features/user_profile/domain/entities/complete_user_profile_entity.dart

import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Para DocumentSnapshot
import 'package:fitmirror_ai/features/user_profile/domain/entities/main_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/gym_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/nutrition_questionnaire_data_entity.dart';

class CompleteUserProfileEntity extends Equatable {
  final String uid; // Cambiado de userId a uid
  final String? username;
  final MainQuestionnaireDataEntity mainQuestionnaire;
  final GymQuestionnaireDataEntity gymQuestionnaire;
  final NutritionQuestionnaireDataEntity nutritionQuestionnaire;
  final List<String> preferredExercises;
  final List<String> dislikedExercises;
  final List<String> injuries;
  final String preferredLanguage;
  final String questionnaireStep;
  final bool onboardingCompleted;

  const CompleteUserProfileEntity({
    required this.uid, // Cambiado de userId a uid
    this.username,
    required this.mainQuestionnaire,
    required this.gymQuestionnaire,
    required this.nutritionQuestionnaire,
    this.preferredExercises = const [],
    this.dislikedExercises = const [],
    this.injuries = const [],
    this.preferredLanguage = 'es',
    this.questionnaireStep = 'initial',
    this.onboardingCompleted = false,
  });

  // Método copyWith actualizado para usar 'uid'
  CompleteUserProfileEntity copyWith({
    String? uid, // Cambiado de userId a uid
    String? username,
    MainQuestionnaireDataEntity? mainQuestionnaire,
    GymQuestionnaireDataEntity? gymQuestionnaire,
    NutritionQuestionnaireDataEntity? nutritionQuestionnaire,
    List<String>? preferredExercises,
    List<String>? dislikedExercises,
    List<String>? injuries,
    String? preferredLanguage,
    String? questionnaireStep,
    bool? onboardingCompleted,
  }) {
    return CompleteUserProfileEntity(
      uid: uid ?? this.uid, // Cambiado de userId a uid
      username: username ?? this.username,
      mainQuestionnaire: mainQuestionnaire ?? this.mainQuestionnaire,
      gymQuestionnaire: gymQuestionnaire ?? this.gymQuestionnaire,
      nutritionQuestionnaire:
          nutritionQuestionnaire ?? this.nutritionQuestionnaire,
      preferredExercises: preferredExercises ?? this.preferredExercises,
      dislikedExercises: dislikedExercises ?? this.dislikedExercises,
      injuries: injuries ?? this.injuries,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      questionnaireStep: questionnaireStep ?? this.questionnaireStep,
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
    );
  }

  // Método factory empty() ajustado para usar 'uid'
  factory CompleteUserProfileEntity.empty() {
    return CompleteUserProfileEntity(
      uid: '', // El uid es requerido, usa un string vacío como placeholder
      username: null, // Si el username es opcional, puede ser null
      mainQuestionnaire: MainQuestionnaireDataEntity.empty(),
      gymQuestionnaire: GymQuestionnaireDataEntity.empty(),
      nutritionQuestionnaire: NutritionQuestionnaireDataEntity.empty(),
      preferredExercises: const [],
      dislikedExercises: const [],
      injuries: const [],
      preferredLanguage: 'es',
      questionnaireStep: 'initial', // Define el paso inicial del cuestionario
      onboardingCompleted:
          false, // Define que el onboarding no está completado por defecto
    );
  }

  // Método fromFirestore ajustado para usar 'uid' (doc.id)
  factory CompleteUserProfileEntity.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    if (data == null) {
      throw Exception(
          "Document data was null when creating CompleteUserProfileEntity");
    }

    return CompleteUserProfileEntity(
      uid: doc.id, // Usa doc.id para el uid
      username: data['username'] as String?,
      mainQuestionnaire: MainQuestionnaireDataEntity.fromMap(
          data['main_questionnaire'] as Map<String, dynamic>? ?? {}),
      gymQuestionnaire: GymQuestionnaireDataEntity.fromMap(
          data['gym_questionnaire'] as Map<String, dynamic>? ?? {}),
      nutritionQuestionnaire: NutritionQuestionnaireDataEntity.fromMap(
          data['nutrition_questionnaire'] as Map<String, dynamic>? ?? {}),
      preferredExercises:
          List<String>.from(data['preferred_exercises'] as List? ?? []),
      dislikedExercises:
          List<String>.from(data['disliked_exercises'] as List? ?? []),
      injuries: List<String>.from(data['injuries'] as List? ?? []),
      preferredLanguage: data['preferred_language'] as String? ?? 'es',
      questionnaireStep: data['questionnaire_step'] as String? ?? 'initial',
      onboardingCompleted: data['onboarding_completed'] as bool? ?? false,
    );
  }

  // Método toFirestore (anteriormente toDocument) ajustado para usar 'uid'
  Map<String, dynamic> toFirestore() {
    // No se incluye 'uid' aquí porque doc.id ya lo maneja
    return {
      'username': username,
      'main_questionnaire': mainQuestionnaire.toMap(),
      'gym_questionnaire': gymQuestionnaire.toMap(),
      'nutrition_questionnaire': nutritionQuestionnaire.toMap(),
      'preferred_exercises': preferredExercises,
      'disliked_exercises': dislikedExercises,
      'injuries': injuries,
      'preferred_language': preferredLanguage,
      'questionnaire_step': questionnaireStep,
      'onboarding_completed': onboardingCompleted,
    };
  }

  @override
  List<Object?> get props => [
        uid, // Cambiado de userId a uid
        username,
        mainQuestionnaire,
        gymQuestionnaire,
        nutritionQuestionnaire,
        preferredExercises,
        dislikedExercises,
        injuries,
        preferredLanguage,
        questionnaireStep,
        onboardingCompleted,
      ];
}
