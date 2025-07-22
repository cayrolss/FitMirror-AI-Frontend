// lib/features/user_profile/data/repositories/user_profile_repository_impl.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmirror_ai/features/user_profile/domain/repositories/user_profile_repository.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/complete_user_profile_entity.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final FirebaseFirestore _firestore;

  UserProfileRepositoryImpl(this._firestore);

  @override
  Future<void> createInitialUserProfile({
    required String uid,
    String? username,
  }) async {
    final userDocRef = _firestore.collection('user_profiles').doc(uid);

    final initialProfile = CompleteUserProfileEntity.empty().copyWith(
      uid: uid, // Asegúrate de usar 'uid' aquí
      username: username ?? 'New User',
      questionnaireStep: 'main',
      onboardingCompleted: false,
    );

    await userDocRef.set(
        initialProfile.toFirestore()); // toFirestore() en vez de toDocument()
  }

  @override
  Future<CompleteUserProfileEntity?> getUserProfile(String uid) async {
    final docSnapshot =
        await _firestore.collection('user_profiles').doc(uid).get();
    if (docSnapshot.exists && docSnapshot.data() != null) {
      return CompleteUserProfileEntity.fromFirestore(docSnapshot);
    }
    return CompleteUserProfileEntity.empty().copyWith(
        uid: uid); // Retorna un perfil vacío pero con UID si no existe
  }

  @override
  Stream<CompleteUserProfileEntity?> getUserProfileStream(String uid) {
    return _firestore
        .collection('user_profiles')
        .doc(uid)
        .snapshots()
        .map((snapshot) {
      if (snapshot.exists && snapshot.data() != null) {
        return CompleteUserProfileEntity.fromFirestore(snapshot);
      }
      return CompleteUserProfileEntity.empty().copyWith(
          uid: uid); // Retorna un perfil vacío pero con UID si no existe
    });
  }

  @override
  Future<void> saveUserProfile(CompleteUserProfileEntity profile) async {
    final userDocRef = _firestore
        .collection('user_profiles')
        .doc(profile.uid); // Usa profile.uid
    await userDocRef.set(profile.toFirestore(), SetOptions(merge: true));
  }

  @override
  Future<void> updateQuestionnaireStep(String uid, String step) async {
    await _firestore.collection('user_profiles').doc(uid).update({
      'questionnaireStep': step,
    });
  }

  @override
  Future<void> updateOnboardingCompleted(String uid, bool completed) async {
    await _firestore.collection('user_profiles').doc(uid).update({
      'onboardingCompleted': completed,
    });
  }

  @override
  Future<void> saveMainQuestionnaireData(
      String uid, Map<String, dynamic> data) async {
    await _firestore.collection('user_profiles').doc(uid).update({
      'main_questionnaire':
          data, // Asegúrate de que el nombre del campo en Firestore sea 'main_questionnaire'
    });
  }

  @override
  Future<void> saveGymQuestionnaireData(
      String uid, Map<String, dynamic> data) async {
    await _firestore.collection('user_profiles').doc(uid).update({
      'gym_questionnaire': data, // Y 'gym_questionnaire'
    });
  }

  @override
  Future<void> saveNutritionQuestionnaireData(
      String uid, Map<String, dynamic> data) async {
    await _firestore.collection('user_profiles').doc(uid).update({
      'nutrition_questionnaire': data, // Y 'nutrition_questionnaire'
    });
  }
}
