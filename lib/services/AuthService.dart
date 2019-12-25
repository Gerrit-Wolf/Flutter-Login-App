import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/models/LoginUserData.dart';

class AuthService {
  static Future<LoginUserData> login(LoginUserData userData) async {
    try {
      _checkUserDataValidity(userData);
      final FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: userData.email, password: userData.password);
      userData.actionSuccess = user != null;
    } catch (exception) {
      userData.actionSuccess = false;
    }
    return userData;
  }

  static Future<LoginUserData> register(LoginUserData userData) async {
    try {
      _checkUserDataValidity(userData);
      final FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: userData.email, password: userData.password);
      userData.actionSuccess = user != null;
    } catch (exception) {
      userData.actionSuccess = false;
    }
    return userData;
  }

  static Future<LoginUserData> resetPassword(LoginUserData userData) async {
    try {
      _checkEmailValidity(userData.email);
      await FirebaseAuth.instance.sendPasswordResetEmail(email: userData.email);
      userData.actionSuccess = true;
    } catch (exception) {
      userData.actionSuccess = false;
    }
    return userData;
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