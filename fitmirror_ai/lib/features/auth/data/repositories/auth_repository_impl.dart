// lib/features/auth/data/repositories/auth_repository_impl.dart

import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:fitmirror_ai/features/auth/domain/entities/user_entity.dart';
import 'package:fitmirror_ai/features/auth/domain/repositories/auth_repository.dart';
import 'package:fitmirror_ai/features/user_profile/domain/repositories/user_profile_repository.dart'; // Importa el repositorio de perfil
import 'package:fitmirror_ai/features/user_profile/domain/entities/complete_user_profile_entity.dart'; // Importa la entidad de perfil
import 'package:fitmirror_ai/features/user_profile/domain/entities/main_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/gym_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/nutrition_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/core/enums.dart'; // Importa tus enums si los usas para valores por defecto

class AuthRepositoryImpl implements AuthRepository {
  final fb_auth.FirebaseAuth _firebaseAuth;
  final UserProfileRepository
      _userProfileRepository; // Inyecta el repositorio de perfil

  AuthRepositoryImpl(this._firebaseAuth,
      this._userProfileRepository); // Constructor actualizado para la inyección

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
        await credential.user!.updateDisplayName(username);
        final newUser = UserEntity(
          uid: credential.user!.uid,
          email: credential.user!.email,
          name: username,
        );

        // NUEVO: Crea y guarda el perfil inicial para el nuevo usuario
        final initialProfile = CompleteUserProfileEntity(
          userId: newUser.uid,
          username: newUser.name,
          mainQuestionnaire: const MainQuestionnaireDataEntity(
            goal: Goal.generalHealth, gender: Gender.other, age: 0, heightCm: 0,
            weightKg: 0.0, // Valores por defecto
          ),
          gymQuestionnaire: const GymQuestionnaireDataEntity(
            workoutPlace: WorkoutPlace.home,
            exerciseFrequency: 0,
            muscleGroupFocus: [],
            weeklyTrainings: 0,
            cardioType: CardioType.none,
            cardioFrequency: 0,
            preferredExercises: [], dislikedExercises: [],
            injuries: [], // NUEVOS campos con valores por defecto
          ),
          nutritionQuestionnaire: const NutritionQuestionnaireDataEntity(
            dietaryType: DietaryType.standard,
            dietFocus: DietFocus.balanced,
            mealsPerDay: 0,
            allergies: [],
            likedFoods: [],
            dislikedFoods: [],
            dietaryRestrictions: [],
          ),
          preferredLanguage: 'es', // NUEVO
          questionnaireStep: 'initial', // NUEVO
          onboardingCompleted: false, // NUEVO
        );
        await _userProfileRepository.saveUserProfile(initialProfile);

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
