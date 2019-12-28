import 'package:firebase_auth/firebase_auth.dart';
import 'package:test_app/models/LoginUserData.dart';

class AuthService {
  const AuthService({this.firebaseAuth});

  final FirebaseAuth firebaseAuth;

  Future<bool> login(LoginUserData userData) async {
    try {
      _checkUserDataValidity(userData);
      return await firebaseAuth.signInWithEmailAndPassword(email: userData.email, password: userData.password) != null;
    } catch (exception) {
      return false;
    }
  }

  Future<bool> register(LoginUserData userData) async {
    try {
      _checkUserDataValidity(userData);
      return await firebaseAuth.createUserWithEmailAndPassword(email: userData.email, password: userData.password) != null;
    } catch (exception) {
      return false;
    }
  }

  Future<bool> resetPassword(LoginUserData userData) async {
    try {
      _checkEmailValidity(userData.email);
      await firebaseAuth.sendPasswordResetEmail(email: userData.email);
      return true;
    } catch (exception) {
      return false;
    }
  }

  void _checkUserDataValidity(LoginUserData userData) {
    if (_isUserDataValid(userData) == false) {
      throw Exception;
    }
  }

  void _checkEmailValidity(String email) {
    if (_isEmailValid(email) == false) {
      throw Exception;
    }
  }

  bool _isUserDataValid(LoginUserData userData) {
    return userData.email != null && userData.password != null && userData.email.isEmpty == false && userData.password.isEmpty == false;
  }
  
  bool _isEmailValid(String email) {
    return email != null && email.isEmpty == false;
  }
}