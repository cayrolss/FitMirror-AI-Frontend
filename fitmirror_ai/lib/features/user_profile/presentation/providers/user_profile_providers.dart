// lib/features/user_profile/presentation/providers/user_profile_providers.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmirror_ai/features/user_profile/data/repositories/user_profile_repository_impl.dart'; // Importa la implementación
import 'package:fitmirror_ai/features/user_profile/domain/repositories/user_profile_repository.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/complete_user_profile_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:fitmirror_ai/features/auth/presentation/providers/auth_providers.dart'; // Necesario para authStateChangesProvider

part 'user_profile_providers.g.dart';

// Provider para la instancia de FirebaseFirestore
final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

// Provider para la implementación de UserProfileRepository
final userProfileRepositoryProvider = Provider<UserProfileRepository>((ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return UserProfileRepositoryImpl(firestore);
});

// Provider para el UserProfileNotifier
@riverpod
class UserProfileNotifier extends _$UserProfileNotifier
    implements AsyncNotifier<CompleteUserProfileEntity?> {
  late final UserProfileRepository _userProfileRepository;
  String? _currentUid; // Cambiado de _currentUserId a _currentUid

  @override
  FutureOr<CompleteUserProfileEntity?> build() async {
    _userProfileRepository = ref.watch(userProfileRepositoryProvider);

    // Escucha los cambios de autenticación para actualizar el UID y recargar el perfil
    ref.listen(authStateChangesProvider, (_, next) async {
      final newUid = next.value?.uid;
      if (newUid != _currentUid) {
        // Solo si el UID ha cambiado
        _currentUid = newUid;
        if (_currentUid != null) {
          state =
              const AsyncLoading(); // Muestra carga mientras se obtiene el nuevo perfil
          state = AsyncData(
              await _userProfileRepository.getUserProfile(_currentUid!));
        } else {
          state = const AsyncData(null); // No hay usuario, el perfil es nulo
        }
      }
    });

    // Carga el perfil inicial basado en el UID actual al construir el Notifier
    _currentUid = ref.read(authStateChangesProvider).value?.uid;
    if (_currentUid != null) {
      return await _userProfileRepository.getUserProfile(_currentUid!);
    }
    return null; // No hay usuario o perfil para cargar inicialmente
  }

  // Método para actualizar el campo questionnaireStep
  Future<void> updateQuestionnaireStep(String uid, String step) async {
    // uid como parámetro
    state = const AsyncLoading();

    if (uid != _currentUid || _currentUid == null) {
      // Asegurarse de que el UID pasado coincida con el usuario actual o manejar si no hay usuario
      state = AsyncError(
          'El UID del perfil no coincide o no hay usuario autenticado.',
          StackTrace.current);
      return;
    }

    try {
      final currentProfile =
          state.value ?? CompleteUserProfileEntity.empty().copyWith(uid: uid);

      final updatedProfile = currentProfile.copyWith(questionnaireStep: step);

      await _userProfileRepository.saveUserProfile(updatedProfile);

      state = AsyncData(updatedProfile);
      print('Questionnaire step updated to: $step');
    } catch (e, st) {
      state =
          AsyncError('Error al actualizar el paso del cuestionario: $e', st);
      print('Error updating questionnaire step: $e');
    }
  }

  // Método para actualizar el campo onboardingCompleted
  Future<void> updateOnboardingCompleted(String uid, bool completed) async {
    // uid como parámetro
    state = const AsyncLoading();

    if (uid != _currentUid || _currentUid == null) {
      state = AsyncError(
          'El UID del perfil no coincide o no hay usuario autenticado.',
          StackTrace.current);
      return;
    }

    try {
      final currentProfile =
          state.value ?? CompleteUserProfileEntity.empty().copyWith(uid: uid);
      final updatedProfile =
          currentProfile.copyWith(onboardingCompleted: completed);
      await _userProfileRepository.saveUserProfile(updatedProfile);
      state = AsyncData(updatedProfile);
      print('Onboarding completed status updated to: $completed');
    } catch (e, st) {
      state = AsyncError('Error al actualizar el estado de onboarding: $e', st);
      print('Error updating onboarding completed status: $e');
    }
  }
}

// StreamProvider.family para el perfil de usuario completo (para leer)
// Usa 'uid' como tipo de parámetro para que coincida con user.uid de Firebase Auth
final completeUserProfileStreamProvider =
    StreamProvider.family<CompleteUserProfileEntity?, String>((ref, uid) {
  // Cambiado de userId a uid
  final userProfileRepo = ref.watch(userProfileRepositoryProvider);
  return userProfileRepo.getUserProfileStream(uid); // Pasa el uid
});
