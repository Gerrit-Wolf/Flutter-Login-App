import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/models/LoginUserData.dart';

class AuthService {
  static Future<LoginUserData> login(LoginUserData userData) async {
    try {
      if (userData.email == null || userData.password == null || userData.email.isEmpty == true || userData.password.isEmpty == true) {
        userData.loginSuccess = false;
        return userData;
      }
      final FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: userData.email, password: userData.password);
      userData.actionSuccess = user != null;
    } catch (exception) {
      userData.actionSuccess = false;
    }
    return userData;
  }

  static Future<LoginUserData> register(LoginUserData userData) async {
    try {
      if (userData.email == null || userData.password == null || userData.email.isEmpty == true || userData.password.isEmpty == true) {
        userData.registerSuccess = false;
        return userData;
      }
      final FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userData.email, password: userData.password);
      userData.actionSuccess = user != null;
    } catch (exception) {
      userData.actionSuccess = false;
    }
    return userData;
  }

  static Future<LoginUserData> resetPassword(LoginUserData userData) async {
    try {
      if (userData.email == null || userData.email.isEmpty == true) {
        userData.resetPasswordSuccess = false;
        return userData;
      }
      await FirebaseAuth.instance.sendPasswordResetEmail(email: userData.email);
      userData.actionSuccess = true;
    } catch (exception) {
      userData.actionSuccess = false;
    }
    return userData;
  }
}