import 'package:flutter/material.dart';
import 'package:test_app/blocs/LoginDataBloc.dart';
import 'package:test_app/components/inputField/InputField.dart';
import 'package:test_app/components/inputField/const/InputFieldTypes.dart';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/services/AuthService.dart';
import 'package:test_app/shared/const/colors.dart';
import 'package:test_app/shared/const/routes.dart';
import 'package:test_app/shared/const/textStyleOptions.dart';
import 'package:test_app/widgets/BlocProvider.dart';

class ResetPasswordContent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ResetPasswordContentState();
}

class ResetPasswordContentState extends State<ResetPasswordContent> {
  final LoginUserData userData = LoginUserData.empty();

  @override
  Widget build(BuildContext context) {
    final LoginDataBloc loginDataBloc = BlocProvider.of<LoginDataBloc>(context);

    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(30.0),
          child: Text(
            AppLocalizations.of(context).translate('RESET_PASSWORD_TITLE'),
            style: TextStyleOptions.loginTitle,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: InputField(
            title: AppLocalizations.of(context).translate('EMAIL'),
            type: InputFieldTypes.EMAIL,
            userData: userData,
            hintText: AppLocalizations.of(context).translate('EMAIL_HINT'),
          ),
        ),
        Container(
            padding: const EdgeInsets.only(
              top: 50.0,
            ),
            width: double.infinity,
            child: MaterialButton(
              child: Text(
                AppLocalizations.of(context).translate('RESET_PASSWORD'),
              ),
              color: const Color(CustomColors.WHITE),
              minWidth: 250.0,
              height: 47.0,
              onPressed: () async {
                loginDataBloc.showLoadingSpinner();
                final LoginUserData updatedData = await AuthService.resetPassword(userData);
                loginDataBloc.hideLoadingSpinner();
                if (updatedData.actionSuccess == true) {
                  Navigator.pushNamed(context, Routes.LOGIN);
                  return;
                }
                final String errorMessage = AppLocalizations.of(context).translate('AUTH_ERROR');
                loginDataBloc.updateErrorMessage(errorMessage);
              },
            )
        ),
        StreamBuilder<String>(
          stream: loginDataBloc.outErrorMessage,
          initialData: null,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.data == null) {
              return const SizedBox(
                height: 0.0
              );
            }
            return Container(
              color: Colors.redAccent,
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.only(
                top: 30.0,
              ),
              child: Text(
                snapshot.data ?? '',
                style: TextStyle(
                  color: Colors.black
                ),
              )
            );
          },
        ),
        StreamBuilder<bool>(
          stream: loginDataBloc.outLoading,
          initialData: false,
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.data == true) {
              return const CircularProgressIndicator();
            }
            return const SizedBox(
                height: 0.0
            );
          },
        )
      ],
    );
  }
}