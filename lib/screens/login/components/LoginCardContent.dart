import 'package:flutter/material.dart';
import 'ForgotPasswordButton.dart';
import 'LoginButton.dart';
import 'InputField.dart';

class LoginCardContent extends StatefulWidget {
  @override
  LoginCardContentState createState() => LoginCardContentState();
}

class LoginCardContentState extends State<LoginCardContent> {
  String username;
  String password;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5.0),
          child: InputField('Username', this.update),
        ),
        Container(
          padding: EdgeInsets.all(5.0),
          child: InputField('Password', this.update),
        ),
        Container(
            padding: EdgeInsets.only(
              top: 10.0,
            ),
            width: double.infinity,
            child: LoginButton(this.username, this.password)
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
      if (context == 'Username') {
        username = data;
        return;
      }
      password = data;
    });
  }
}