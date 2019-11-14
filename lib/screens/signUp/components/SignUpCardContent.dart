import 'package:flutter/material.dart';
import 'package:test_app/services/AuthService.dart';
import '../../../components/InputField.dart';

class SignUpCardContent extends StatefulWidget {
  @override
  SignUpCardContentState createState() => SignUpCardContentState();
}

class SignUpCardContentState extends State<SignUpCardContent> {
  String email;
  String password;
  String errorMessage;
  bool hasError;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(5.0),
          child: InputField('Email Adress', update),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: InputField('Password', update),
        ),
        Container(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            width: double.infinity,
            child: RaisedButton(
              child: const Text('Sign Up!'),
              color: const Color(0xffb2bec3),
              onPressed: () async {
                final bool signUpSuccess = await AuthService.signUp(email, password, checkForSignUpError);

                if (signUpSuccess == true) {
                  Navigator.pushNamed(context, '/home');
                }
              },
            )
        ),
        Visibility(
          child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),
              color: Colors.redAccent,
              child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    errorMessage ?? '',
                    style: TextStyle(
                        color: Colors.black
                    ),
                  )
              )
          ),
          visible: hasError ?? false,
        )
      ],
    );
  }

  void update(String context, String data) {
    setState(() {
      if (context == 'Password') {
        password = data;
        return;
      }
      email = data;
    });
  }

  void checkForSignUpError(String message) {
    setState(() {
      errorMessage = message;
      hasError = true;
    });
  }
}