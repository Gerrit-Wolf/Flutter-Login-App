import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static Future<bool> signIn(String email, String password, Function checkForLoginErrors) async {
    try {
      if (email == null || password == null || email.isEmpty == true || password.isEmpty) {
        checkForLoginErrors('Die Eingaben dürfen nicht leer sein!');
        return false;
      }
      final FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      return user != null;
    } catch (exception) {
      checkForLoginErrors(exception.message);
    }
    return false;
  }

  static Future<bool> signUp(String email, String password, Function checkForSignUpErrors) async {
    try {
      if (email == null || password == null || email.isEmpty == true || password.isEmpty) {
        checkForSignUpErrors('Die Eingaben dürfen nicht leer sein!');
        return false;
      }
      final FirebaseUser user = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
      return user != null;
    } catch (exception) {
      checkForSignUpErrors(exception.message);
    }
    return false;
  }
}