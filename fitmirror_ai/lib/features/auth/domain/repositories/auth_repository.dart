// lib/features/auth/domain/repositories/auth_repository.dart

import 'package:fitmirror_ai/features/auth/domain/entities/user_entity.dart'; // Asegúrate de que UserEntity esté correctamente definido

abstract class AuthRepository {
  // Getter para el usuario actualmente autenticado
  UserEntity? get currentUser;

  // Stream para observar los cambios de estado de autenticación
  Stream<UserEntity?> get authStateChanges;

  // Método para iniciar sesión con email y contraseña
  Future<UserEntity?> signInWithEmailAndPassword(String email, String password);

  // Método para registrarse con email, contraseña y nombre de usuario
  Future<UserEntity?> signUpWithEmailAndPassword(
      String email, String password, String username);

  // Método para cerrar sesión
  Future<void> signOut();
}
