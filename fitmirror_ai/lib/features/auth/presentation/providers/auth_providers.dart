// lib/features/auth/presentation/providers/auth_providers.dart

import 'package:firebase_auth/firebase_auth.dart'
    as fb_auth; // Alias para evitar conflicto con User de tu entidad
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fitmirror_ai/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:fitmirror_ai/features/auth/domain/repositories/auth_repository.dart';
import 'package:fitmirror_ai/features/auth/domain/entities/user_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/complete_user_profile_entity.dart'; // Importa la nueva entidad
import 'package:fitmirror_ai/features/user_profile/domain/entities/main_questionnaire_data_entity.dart'; // Importa las entidades anidadas
import 'package:fitmirror_ai/features/user_profile/domain/entities/gym_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/nutrition_questionnaire_data_entity.dart';
import 'package:fitmirror_ai/features/user_profile/domain/repositories/user_profile_repository.dart'; // Importa el repositorio de perfil
import 'package:fitmirror_ai/features/user_profile/presentation/providers/user_profile_providers.dart'; // Importa los providers de perfil
import 'package:fitmirror_ai/core/enums.dart'; // Asegúrate de tener todos los Enums aquí

part 'auth_providers.g.dart'; // ¡Mantenemos esta línea!

// 1. Provider para la instancia de FirebaseAuth, ahora generado
@riverpod
fb_auth.FirebaseAuth firebaseAuthInstance(FirebaseAuthInstanceRef ref) {
  return fb_auth.FirebaseAuth.instance;
}

// 2. Provider para la implementación del AuthRepository, ahora generado
@riverpod
AuthRepository authRepository(AuthRepositoryRef ref) {
  final firebaseAuth =
      ref.watch(firebaseAuthInstanceProvider); // Accede al provider generado
  // Asegúrate de que userProfileRepositoryProvider esté definido correctamente en user_profile_providers.dart
  final userProfileRepository = ref
      .watch(userProfileRepositoryProvider); // Obtén el repositorio de perfil
  // Pasa userProfileRepository al constructor de AuthRepositoryImpl
  return AuthRepositoryImpl(
      firebaseAuth, userProfileRepository); // ¡CORREGIDO AQUÍ!
}

// 3. StreamProvider para el estado de autenticación, ahora generado
@riverpod
Stream<UserEntity?> authStateChanges(AuthStateChangesRef ref) {
  final authRepo =
      ref.watch(authRepositoryProvider); // Accede al provider generado
  return authRepo.authStateChanges;
}

// 4. StateNotifierProvider para la lógica de autenticación (Login/Register), ahora generado
@riverpod
AuthController authController(AuthControllerRef ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  final userProfileRepository = ref.watch(userProfileRepositoryProvider);
  return AuthController(authRepository, userProfileRepository);
}

class AuthController extends StateNotifier<AsyncValue<void>> {
  final AuthRepository _authRepository;
  final UserProfileRepository _userProfileRepository; // Nueva dependencia

  AuthController(this._authRepository, this._userProfileRepository)
      : super(const AsyncData(null));

  Future<void> signIn(String email, String password) async {
    state = const AsyncLoading();
    try {
      await _authRepository.signInWithEmailAndPassword(email, password);
      state = const AsyncData(null); // Éxito
    } catch (e, st) {
      state = AsyncError(e, st); // Error
    }
  }

  Future<void> signUp(String email, String password, String username) async {
    state = const AsyncLoading();
    try {
      final user = await _authRepository.signUpWithEmailAndPassword(
          email, password, username);
      if (user != null) {
        // Inicializar los datos del cuestionario con valores por defecto
        final initialMainQuestionnaire = MainQuestionnaireDataEntity(
          goal: Goal.generalHealth,
          gender: Gender.other,
          age: 0,
          heightCm: 0,
          weightKg: 0.0,
          goalWeightKg: 0.0,
          weightChangeSpeed: WeightChangeSpeed.normal,
        );

        // CORREGIDO: preferredExercises, dislikedExercises, injuries van aquí
        final initialGymQuestionnaire = GymQuestionnaireDataEntity(
          workoutPlace: WorkoutPlace.home,
          exerciseFrequency: 0,
          muscleGroupFocus: const [],
          weeklyTrainings: 0,
          cardioType: CardioType.none,
          cardioFrequency: 0,
          preferredExercises: const [], // Van aquí
          dislikedExercises: const [], // Van aquí
          injuries: const [], // Van aquí
        );

        final initialNutritionQuestionnaire = NutritionQuestionnaireDataEntity(
          dietaryType: DietaryType.standard,
          dietFocus: DietFocus.balanced,
          mealsPerDay: 0,
          allergies: const [],
          likedFoods: const [],
          dislikedFoods: const [],
          dietaryRestrictions: const [],
        );

        // Después de un registro exitoso, guarda un perfil de usuario inicial en Firestore
        // CORREGIDO: preferredLanguage, questionnaireStep, onboardingCompleted van en CompleteUserProfileEntity
        final initialProfile = CompleteUserProfileEntity(
          userId: user.uid,
          username: username,
          mainQuestionnaire: initialMainQuestionnaire,
          gymQuestionnaire:
              initialGymQuestionnaire, // Pasar la instancia con los nuevos campos
          nutritionQuestionnaire: initialNutritionQuestionnaire,
          preferredLanguage: 'es', // Va aquí
          questionnaireStep: 'initial', // Va aquí
          onboardingCompleted: false, // Va aquí
        );
        await _userProfileRepository.saveUserProfile(initialProfile);
      }
      state = const AsyncData(null); // Éxito
    } catch (e, st) {
      state = AsyncError(e, st); // Error
    }
  }

  Future<void> signOut() async {
    state = const AsyncLoading();
    try {
      await _authRepository.signOut();
      state = const AsyncData(null); // Éxito
    } catch (e, st) {
      state = AsyncError(e, st); // Error
    }
  }
}
