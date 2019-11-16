import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<bool> signIn(String email, String password, Function handleError) async {
    try {
      if (email == null || password == null || email.isEmpty == true || password.isEmpty) {
        handleError();
        return false;
      }
      final FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return user != null;
    } catch (exception) {
      handleError();
    }
    return false;
  }

  static Future<bool> signUp(String email, String password, Function handleError) async {
    try {
      if (email == null || password == null || email.isEmpty == true || password.isEmpty) {
        handleError();
        return false;
      }
      final FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return user != null;
    } catch (exception) {
      handleError();
    }
    return false;
  }

  static Future<void> resetPassword(String email, Function handleError) async {
    try {
      if (email == null || email.isEmpty == true) {
        handleError();
        return;
      }
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } catch (exception) {
      handleError();
    }
  }
}