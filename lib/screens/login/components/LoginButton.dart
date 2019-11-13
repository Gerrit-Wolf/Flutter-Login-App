import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String username;
  final String password;

  LoginButton(this.username, this.password);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Login'),
      color: Color(0xffb2bec3),
      onPressed: (){},
    );
  }
}