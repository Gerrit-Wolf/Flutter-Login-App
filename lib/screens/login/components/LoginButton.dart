import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_app/blocs/LoginDataBloc.dart';
import 'package:test_app/components/buttons/PrimaryButton.dart';
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

    return PrimaryButton(
      buttonText: AppLocalizations.of(context).translate('LOGIN'),
      color: const Color(CustomColors.WHITE),
      onPressed: () async {
        final AuthService authService = AuthService(firebaseAuth: FirebaseAuth.instance);
        loginDataBloc.showLoadingSpinner();
        final bool actionSuccess = await authService.login(userData);
        loginDataBloc.hideLoadingSpinner();

        if (actionSuccess == true) {
          Navigator.pushNamed(context, Routes.MAIN);
          return;
        }

        final String errorMessage = AppLocalizations.of(context).translate('AUTH_ERROR');
        loginDataBloc.updateErrorMessage(errorMessage);
      },
    );
  }
}