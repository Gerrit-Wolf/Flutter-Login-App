import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<bool> signIn(String email, String password) async {
    try {
      final FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return user != null;
    } catch (exception) {
      print(exception.toString());
    }
    return false;
  }

  static Future<bool> signUp(String email, String password) async {
    try {
      final FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return user != null;
    } catch (exception) {
      print(exception.toString());
    }
    return false;
  }
}