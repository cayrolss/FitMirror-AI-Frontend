abstract class AuthRepository {
  Stream<UserEntity?> get authStateChanges;
  UserEntity? get currentUser;
  Future<UserEntity?> signInWithEmailAndPassword(String email, String password);
  Future<UserEntity?> signUpWithEmailAndPassword(
      String email, String password, String username);
  Future<void> signOut();
}
