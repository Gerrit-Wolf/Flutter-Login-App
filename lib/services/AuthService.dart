import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/models/LoginUserData.dart';

class AuthService {
  static Future<bool> signIn(LoginUserData userData, Function handleError) async {
    try {
      if (userData.email == null || userData.password == null || userData.email.isEmpty == true || userData.password.isEmpty == true) {
        handleError();
        return false;
      }
      final FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: userData.email, password: userData.password);
      return user != null;
    } catch (exception) {
      handleError();
    }
    return false;
  }

  static Future<bool> signUp(LoginUserData userData, Function handleError) async {
    try {
      if (userData.email == null || userData.password == null || userData.email.isEmpty == true || userData.password.isEmpty == true) {
        handleError();
        return false;
      }
      final FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userData.email, password: userData.password);
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