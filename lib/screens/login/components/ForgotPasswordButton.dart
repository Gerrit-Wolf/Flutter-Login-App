import 'package:flutter/material.dart';

class ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: const Text('Forgot Password?'),
      onPressed: (){
        Navigator.pushNamed(context, '/resetPassword');
      },
    );
  }
}