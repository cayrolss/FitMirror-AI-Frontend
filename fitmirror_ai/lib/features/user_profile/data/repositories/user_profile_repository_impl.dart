// lib/features/user_profile/data/repositories/user_profile_repository_impl.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/complete_user_profile_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/repositories/user_profile_repository.dart';

class UserProfileRepositoryImpl implements UserProfileRepository {
  final FirebaseFirestore _firestore;

  UserProfileRepositoryImpl(this._firestore);

  @override
  Future<void> saveUserProfile(CompleteUserProfileEntity userProfile) async {
    await _firestore
        .collection('users')
        .doc(userProfile.userId)
        .collection('profile')
        .doc('profile_data')
        .set(userProfile.toFirestore());
  }

  @override
  Future<CompleteUserProfileEntity?> getUserProfile(String userId) async {
    final docSnapshot = await _firestore
        .collection('users')
        .doc(userId)
        .collection('profile')
        .doc('profile_data')
        .get();

    if (docSnapshot.exists && docSnapshot.data() != null) {
      return CompleteUserProfileEntity.fromFirestore(docSnapshot);
    }
    return null;
  }

  @override
  // NUEVO: Implementación para obtener el perfil como un stream
  Stream<CompleteUserProfileEntity?> getUserProfileStream(String userId) {
    return _firestore
        .collection('users')
        .doc(userId)
        .collection('profile')
        .doc('profile_data')
        .snapshots() // Obtiene un stream de snapshots
        .map((docSnapshot) {
      if (docSnapshot.exists && docSnapshot.data() != null) {
        return CompleteUserProfileEntity.fromFirestore(docSnapshot);
      }
      return null;
    });
  }
}
