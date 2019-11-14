import 'package:flutter/material.dart';
import '../../../components/InputField.dart';
import 'ForgotPasswordButton.dart';
import 'LoginButton.dart';

class LoginCardContent extends StatefulWidget {
  @override
  LoginCardContentState createState() => LoginCardContentState();
}

class LoginCardContentState extends State<LoginCardContent> {
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
          child: InputField('E-Mail Adress', update),
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
            child: LoginButton(email, password, checkForLoginError)
        ),
        Container(
          alignment: Alignment.centerRight,
          child: ForgotPasswordButton(),
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

  void checkForLoginError(String message) {
    setState(() {
      errorMessage = message;
      hasError = true;
    });
  }
}