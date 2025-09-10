import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  Future<void> signIn({required String email, required String password}) async {
    // Implement sign-in logic here
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseException catch (e) {
      throw Exception('FirebaseException: ${e.code} ${e.message}');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseException catch (e) {
      throw Exception('FirebaseException: ${e.code} ${e.message}');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<void> signUp({required String email, required String password}) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
    } on FirebaseException catch (e) {
      throw Exception('FirebaseException: ${e.code} ${e.message}');
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
