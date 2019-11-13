import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(this.username, this.password);

  final String username;
  final String password;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: const Text('Login'),
      color: const Color(0xffb2bec3),
      onPressed: (){},
    );
  }
}