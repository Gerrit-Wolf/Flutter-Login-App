import 'package:flutter/material.dart';
import 'package:test_app/shared/const/routes.dart';

class ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: const Text('Forgot Password?'),
      onPressed: (){
        Navigator.pushNamed(context, Routes.RESET_PASSWORD);
      },
    );
  }
}