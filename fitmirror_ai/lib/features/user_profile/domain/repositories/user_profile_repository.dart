// lib/features/user_profile/domain/repositories/user_profile_repository.dart

import 'package:fitmirror_ai/features/user_profile/domain/entities/complete_user_profile_entity.dart';

abstract class UserProfileRepository {
  // Método para crear el perfil inicial del usuario
  Future<void> createInitialUserProfile({
    required String uid, // Usa uid
    String? username,
  });

  // Método para obtener el perfil de usuario como un Future (una vez)
  Future<CompleteUserProfileEntity?> getUserProfile(String uid); // Usa uid

  // Método para obtener el perfil de usuario como un Stream (en tiempo real)
  Stream<CompleteUserProfileEntity?> getUserProfileStream(
      String uid); // Usa uid

  // Método para guardar/actualizar el perfil completo de un usuario
  Future<void> saveUserProfile(CompleteUserProfileEntity profile);

  // Métodos para actualizar campos específicos del perfil
  Future<void> updateQuestionnaireStep(String uid, String step); // Usa uid
  Future<void> updateOnboardingCompleted(String uid, bool completed); // Usa uid
  Future<void> saveMainQuestionnaireData(
      String uid, Map<String, dynamic> data); // Usa uid
  Future<void> saveGymQuestionnaireData(
      String uid, Map<String, dynamic> data); // Usa uid
  Future<void> saveNutritionQuestionnaireData(
      String uid, Map<String, dynamic> data); // Usa uid
}
