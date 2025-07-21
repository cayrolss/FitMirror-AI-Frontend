// lib/features/user_profile/domain/entities/complete_user_profile_entity.dart

import 'package:equatable/equatable.dart';
import 'package:cloud_firestore/cloud_firestore.dart'; // Para DocumentSnapshot
import 'package:fitmirror_ai/features/user_profile/domain/entities/main_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/gym_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/nutrition_questionnaire_data_entity.dart';

class CompleteUserProfileEntity extends Equatable {
  final String userId;
  final String? username;
  final MainQuestionnaireDataEntity mainQuestionnaire;
  final GymQuestionnaireDataEntity gymQuestionnaire;
  final NutritionQuestionnaireDataEntity nutritionQuestionnaire;
  final String preferredLanguage; // NUEVO
  final String questionnaireStep; // NUEVO
  final bool onboardingCompleted; // NUEVO

  const CompleteUserProfileEntity({
    required this.userId,
    this.username,
    required this.mainQuestionnaire,
    required this.gymQuestionnaire,
    required this.nutritionQuestionnaire,
    this.preferredLanguage = 'es', // NUEVO: valor por defecto
    this.questionnaireStep = 'initial', // NUEVO: valor por defecto
    this.onboardingCompleted = false, // NUEVO: valor por defecto
  });

  // Método copyWith actualizado
  CompleteUserProfileEntity copyWith({
    String? userId,
    String? username,
    MainQuestionnaireDataEntity? mainQuestionnaire,
    GymQuestionnaireDataEntity? gymQuestionnaire,
    NutritionQuestionnaireDataEntity? nutritionQuestionnaire,
    String? preferredLanguage,
    String? questionnaireStep,
    bool? onboardingCompleted,
  }) {
    return CompleteUserProfileEntity(
      userId: userId ?? this.userId,
      username: username ?? this.username,
      mainQuestionnaire: mainQuestionnaire ?? this.mainQuestionnaire,
      gymQuestionnaire: gymQuestionnaire ?? this.gymQuestionnaire,
      nutritionQuestionnaire:
          nutritionQuestionnaire ?? this.nutritionQuestionnaire,
      preferredLanguage: preferredLanguage ?? this.preferredLanguage,
      questionnaireStep: questionnaireStep ?? this.questionnaireStep,
      onboardingCompleted: onboardingCompleted ?? this.onboardingCompleted,
    );
  }

  factory CompleteUserProfileEntity.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>?;
    if (data == null) {
      throw Exception(
          "Document data was null when creating CompleteUserProfileEntity");
    }

    return CompleteUserProfileEntity(
      userId: doc.id,
      username: data['username'] as String?,
      mainQuestionnaire: MainQuestionnaireDataEntity.fromMap(
          data['main_questionnaire'] as Map<String, dynamic>? ?? {}),
      gymQuestionnaire: GymQuestionnaireDataEntity.fromMap(
          data['gym_questionnaire'] as Map<String, dynamic>? ?? {}),
      nutritionQuestionnaire: NutritionQuestionnaireDataEntity.fromMap(
          data['nutrition_questionnaire'] as Map<String, dynamic>? ?? {}),
      preferredLanguage: data['preferred_language'] as String? ?? 'es', // NUEVO
      questionnaireStep:
          data['questionnaire_step'] as String? ?? 'initial', // NUEVO
      onboardingCompleted:
          data['onboarding_completed'] as bool? ?? false, // NUEVO
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'username': username,
      'main_questionnaire': mainQuestionnaire.toMap(),
      'gym_questionnaire': gymQuestionnaire.toMap(),
      'nutrition_questionnaire': nutritionQuestionnaire.toMap(),
      'preferred_language': preferredLanguage, // NUEVO
      'questionnaire_step': questionnaireStep, // NUEVO
      'onboarding_completed': onboardingCompleted, // NUEVO
    };
  }

  @override
  List<Object?> get props => [
        userId,
        username,
        mainQuestionnaire,
        gymQuestionnaire,
        nutritionQuestionnaire,
        preferredLanguage, // NUEVO
        questionnaireStep, // NUEVO
        onboardingCompleted, // NUEVO
      ];
}
