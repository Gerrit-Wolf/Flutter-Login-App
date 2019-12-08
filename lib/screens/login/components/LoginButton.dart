import 'package:flutter/material.dart';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/services/AuthService.dart';
import 'package:test_app/shared/const/routes.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({this.userData});

  final LoginUserData userData;

  @override
  LoginButtonState createState() => LoginButtonState(userData: userData);
}

class LoginButtonState extends State<LoginButton> {
  LoginButtonState({this.userData});

  LoginUserData userData;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text(
          AppLocalizations.of(context).translate('LOGIN')
      ),
      color: const Color(0xffb2bec3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      onPressed: () async {
        userData = await AuthService.signIn(userData);

        if (userData.loginSuccess == true) {
          Navigator.pushNamed(context, Routes.HOME);
          return;
        }

        userData.errorMessage = AppLocalizations.of(context).translate('AUTH_ERROR');
      },
    );
  }
}