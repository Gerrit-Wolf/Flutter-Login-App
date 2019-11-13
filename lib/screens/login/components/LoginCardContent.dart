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
            child: LoginButton(email, password)
        ),
        Container(
          alignment: Alignment.centerRight,
          child: ForgotPasswordButton(),
        ),
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
}