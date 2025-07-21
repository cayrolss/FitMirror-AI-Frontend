// lib/features/auth/domain/repositories/auth_repository.dart

import 'package:fitmirror_ai/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  // ... (tus otros métodos existentes)

  // NUEVO: Getter para el usuario actualmente autenticado
  UserEntity? get currentUser;

  Stream<UserEntity?> get authStateChanges;

  Future<void> signInWithEmailAndPassword(String email, String password);
  Future<UserEntity?> signUpWithEmailAndPassword(
      String email, String password, String username);
  Future<void> signOut();
}
