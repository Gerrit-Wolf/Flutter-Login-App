import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/models/LoginUserData.dart';

class AuthService {
  static Future<bool> login(LoginUserData userData) async {
    try {
      _checkUserDataValidity(userData);
      return await FirebaseAuth.instance.signInWithEmailAndPassword(email: userData.email, password: userData.password) != null;
    } catch (exception) {
      return false;
    }
  }

  static Future<bool> register(LoginUserData userData) async {
    try {
      _checkUserDataValidity(userData);
      return await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userData.email, password: userData.password) != null;
    } catch (exception) {
      return false;
    }
  }

  static Future<bool> resetPassword(LoginUserData userData) async {
    try {
      _checkEmailValidity(userData.email);
      await FirebaseAuth.instance.sendPasswordResetEmail(email: userData.email);
      return true;
    } catch (exception) {
      return false;
    }
  }

  static void _checkUserDataValidity(LoginUserData userData) {
    if (_isUserDataValid(userData) == false) {
      throw Exception;
    }
  }

  static void _checkEmailValidity(String email) {
    if (_isEmailValid(email) == false) {
      throw Exception;
    }
  }

  static bool _isUserDataValid(LoginUserData userData) {
    return userData.email != null && userData.password != null && userData.email.isEmpty == false && userData.password.isEmpty == false;
  }
  
  static bool _isEmailValid(String email) {
    return email != null && email.isEmpty == false;
  }
}