import 'package:flutter/material.dart';
import 'package:test_app/blocs/LoginDataBloc.dart';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/services/AuthService.dart';
import 'package:test_app/shared/const/colors.dart';
import 'package:test_app/shared/const/routes.dart';
import 'package:test_app/widgets/BlocProvider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({this.userData});

  final LoginUserData userData;

  @override
  Widget build(BuildContext context) {
    final LoginDataBloc loginDataBloc = BlocProvider.of<LoginDataBloc>(context);

    return MaterialButton(
      child: Text(
          AppLocalizations.of(context).translate('LOGIN')
      ),
      color: const Color(CustomColors.WHITE),
      minWidth: 250.0,
      height: 47.0,
      onPressed: () async {
        loginDataBloc.showLoadingSpinner();
        final LoginUserData signedInData = await AuthService.signIn(userData);
        loginDataBloc.hideLoadingSpinner();

        if (signedInData.loginSuccess == true) {
          Navigator.pushNamed(context, Routes.HOME);
          return;
        }

        final String errorMessage = AppLocalizations.of(context).translate('AUTH_ERROR');
        loginDataBloc.updateErrorMessage(errorMessage);
      },
    );
  }
}