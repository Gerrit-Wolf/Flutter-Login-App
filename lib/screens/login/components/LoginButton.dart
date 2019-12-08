import 'package:flutter/material.dart';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/services/AuthService.dart';
import 'package:test_app/shared/const/routes.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({this.userData, this.onPressed});

  final LoginUserData userData;
  final Function onPressed;

  @override
  LoginButtonState createState() => LoginButtonState(userData: userData, onPressed: onPressed);
}

class LoginButtonState extends State<LoginButton> {
  LoginButtonState({this.userData, this.onPressed});

  LoginUserData userData;
  final Function onPressed;

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
        onPressed();
      },
    );
  }
}