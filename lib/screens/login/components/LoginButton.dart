import 'package:flutter/material.dart';
import 'package:test_app/blocs/LoginUserDataBloc.dart';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/services/AuthService.dart';
import 'package:test_app/shared/const/routes.dart';
import 'package:test_app/widgets/BlocProvider.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({this.userData});

  final LoginUserData userData;

  @override
  Widget build(BuildContext context) {
    final LoginUserDataBloc userDataBloc = BlocProvider.of<LoginUserDataBloc>(context);

    return RaisedButton(
      child: Text(
          AppLocalizations.of(context).translate('LOGIN')
      ),
      color: const Color(0xffb2bec3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      onPressed: () async {
        final LoginUserData signedInData = await AuthService.signIn(userData);

        if (signedInData.loginSuccess == true) {
          Navigator.pushNamed(context, Routes.HOME);
          return;
        }

        signedInData.errorMessage = AppLocalizations.of(context).translate('AUTH_ERROR');
        userDataBloc.updateUserData(signedInData);
      },
    );
  }
}