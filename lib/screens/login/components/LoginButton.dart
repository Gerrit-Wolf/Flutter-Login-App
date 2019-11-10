import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String username;
  final String password;

  LoginButton(this.username, this.password);
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Login'),
      onPressed: (){
        print('username: $username');
        print('password: $password');
      },
    );
  }
}