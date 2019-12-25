import 'package:flutter/material.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/shared/const/colors.dart';
import 'package:test_app/shared/const/routes.dart';

class ForgotPasswordButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
          AppLocalizations.of(context).translate('FORGOT_PASSWORD'),
          style: const TextStyle(
            color: Color(CustomColors.WHITE),
          )
      ),
      onPressed: (){
        Navigator.pushNamed(context, Routes.RESET_PASSWORD);
      },
    );
  }
}