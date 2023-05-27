import 'package:firebase_auth/firebase_auth.dart' as auth;

abstract class BaseAuthRepository {
  Stream<auth.User?>? get users;
  Future<auth.User?> signUp({required String email, required String password});
  Future<void> loginWithEmailAndPassword(
      {required String email, required String password});
  Future<void> logout();
}
