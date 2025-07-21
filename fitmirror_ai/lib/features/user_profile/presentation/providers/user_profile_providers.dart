// lib/features/user_profile/presentation/providers/user_profile_providers.dart

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitmirror_ai/features/user_profile/data/repositories/user_profile_repository_impl.dart';
import 'package:fitmirror_ai/features/user_profile/domain/repositories/user_profile_repository.dart';
import 'package:fitmirror_ai/features/user_profile/domain/entities/complete_user_profile_entity.dart'; // Importa la entidad completa
import 'package:riverpod_annotation/riverpod_annotation.dart'; // Necesario para @riverpod
import 'package:fitmirror_ai/features/auth/presentation/providers/auth_providers.dart'; // ¡Añade esta línea!

part 'user_profile_providers.g.dart'; // ¡Asegúrate de tener esta línea!

// Provider para la instancia de FirebaseFirestore
final firebaseFirestoreProvider = Provider<FirebaseFirestore>((ref) {
  return FirebaseFirestore.instance;
});

// Provider para la implementación de UserProfileRepository
final userProfileRepositoryProvider = Provider<UserProfileRepository>((ref) {
  final firestore = ref.watch(firebaseFirestoreProvider);
  return UserProfileRepositoryImpl(firestore);
});

// NUEVO: StreamProvider para el perfil de usuario completo
@riverpod
Stream<CompleteUserProfileEntity?> completeUserProfileStream(
    CompleteUserProfileStreamRef ref) {
  final authRepository = ref.watch(
      authRepositoryProvider); // Asume que authRepositoryProvider está disponible
  final userProfileRepo = ref.watch(userProfileRepositoryProvider);

  // Si no hay usuario autenticado, devuelve un stream vacío o null
  if (authRepository.currentUser == null) {
    return Stream.value(null);
  }
  // Llama al método getUserProfileStream del repositorio
  return userProfileRepo.getUserProfileStream(authRepository.currentUser!.uid);
}
