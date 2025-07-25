// lib/features/auth/data/repositories/auth_repository_impl.dart

import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:fitmirror_ai/features/auth/domain/entities/user_entity.dart';
import 'package:fitmirror_ai/features/auth/domain/repositories/auth_repository.dart';
import 'package:fitmirror_ai/features/user_profile/domain/repositories/user_profile_repository.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/complete_user_profile_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/main_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/gym_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/nutrition_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/core/enums.dart';

class AuthRepositoryImpl implements AuthRepository {
  final fb_auth.FirebaseAuth _firebaseAuth;
  final UserProfileRepository _userProfileRepository;

  AuthRepositoryImpl(this._firebaseAuth, this._userProfileRepository);

  @override
  Stream<UserEntity?> get authStateChanges {
    return _firebaseAuth.authStateChanges().map((fb_auth.User? user) {
      if (user == null) {
        return null;
      }
      return UserEntity(
        uid: user.uid,
        email: user.email,
        name: user.displayName ?? '',
      );
    });
  }

  @override
  UserEntity? get currentUser {
    final fb_auth.User? user = _firebaseAuth.currentUser;
    if (user == null) {
      return null;
    }
    return UserEntity(
      uid: user.uid,
      email: user.email,
      name: user.displayName ?? '',
    );
  }

  @override
  Future<UserEntity?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        return UserEntity(
          uid: credential.user!.uid,
          email: credential.user!.email,
          name: credential.user!.displayName ?? '',
        );
      }
      return null;
    } on fb_auth.FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      throw Exception('Error desconocido al iniciar sesión: $e');
    }
  }

  @override
  Future<UserEntity?> signUpWithEmailAndPassword(
      String email, String password, String username) async {
    try {
      final credential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (credential.user != null) {
        final newUser = UserEntity(
          uid: credential.user!.uid,
          email: credential.user!.email,
          name: username,
        );

        final initialProfile = CompleteUserProfileEntity(
          uid: newUser.uid,
          username: newUser.name,
          mainQuestionnaire: const MainQuestionnaireDataEntity(
            goal: Goal.generalHealth,
            gender: Gender.other,
            age: 0,
            heightCm: 0,
            weightKg: 0.0,
            goalWeightKg: 0.0,
            weightChangeSpeed: WeightChangeSpeed.normal,
            activityLevel: ActivityLevel.sedentary,
          ),
          gymQuestionnaire: const GymQuestionnaireDataEntity(
            workoutPlace: WorkoutPlace.home,
            exerciseFrequency: 0,
            muscleGroupFocus: const [],
            weeklyTrainings: 0,
            cardioType: CardioType.none,
            cardioFrequency: 0,
          ),
          nutritionQuestionnaire: const NutritionQuestionnaireDataEntity(
            dietaryType: DietaryType.standard,
            dietFocus: DietFocus.balanced,
            mealsPerDay: 0,
            allergies: const [],
            likedFoods: const [],
            dislikedFoods: const [],
            dietaryRestrictions: const [],
          ),
          preferredExercises: const [],
          dislikedExercises: const [],
          injuries: const [],
          preferredLanguage: 'es',
          questionnaireStep: 'initial',
          onboardingCompleted: false,
        );

        // 🔥 ARREGLO CLAVE: Operaciones paralelas
        await Future.wait([
          credential.user!.updateDisplayName(username),
          _userProfileRepository.saveUserProfile(initialProfile)
        ]);

        return newUser;
      }
      return null;
    } on fb_auth.FirebaseAuthException catch (e) {
      throw e;
    } catch (e) {
      throw Exception('Error desconocido al registrarse: $e');
    }
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
