// lib/features/user_profile/domain/repositories/user_profile_repository.dart

import 'package:fitmirror_ai/features/user_profile/domain/entities/complete_user_profile_entity.dart';

abstract class UserProfileRepository {
  Future<void> saveUserProfile(CompleteUserProfileEntity userProfile);
  Future<CompleteUserProfileEntity?> getUserProfile(String userId);
  Stream<CompleteUserProfileEntity?> getUserProfileStream(String userId);
}
