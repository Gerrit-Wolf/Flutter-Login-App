import 'package:flutter/material.dart';
import '../../../components/InputField.dart';

class SignUpCardContent extends StatefulWidget {
  @override
  SignUpCardContentState createState() => SignUpCardContentState();
}

class SignUpCardContentState extends State<SignUpCardContent> {
  String username;
  String email;
  String password;

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
          child: InputField('Username', update),
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
              onPressed: (){},
            )
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

      if (context == 'Email Adress') {
        email = data;
        return;
      }
      password = data;
    });
  }
}