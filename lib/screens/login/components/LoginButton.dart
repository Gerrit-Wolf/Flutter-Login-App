import 'package:flutter/material.dart';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/services/AuthService.dart';
import 'package:test_app/shared/const/routes.dart';

class LoginButton extends StatelessWidget {
  const LoginButton(this.userData, this.checkForLoginErrors);

  final LoginUserData userData;
  final Function checkForLoginErrors;

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
        final bool loginSuccess = await AuthService.signIn(userData, checkForLoginErrors);

        if (loginSuccess == true) {
          Navigator.pushNamed(context, Routes.HOME);
        }
      },
    );
  }
}