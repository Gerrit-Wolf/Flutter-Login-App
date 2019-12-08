import 'package:flutter/material.dart';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/services/AppLocalizations.dart';
import '../../../components/inputField/InputField.dart';
import '../../../components/inputField/const/InputFieldTypes.dart';
import 'ForgotPasswordButton.dart';
import 'LoginButton.dart';

class LoginCardContent extends StatefulWidget {
  @override
  LoginCardContentState createState() => LoginCardContentState();
}

class LoginCardContentState extends State<LoginCardContent> {
  LoginUserData userData = LoginUserData.empty();
  bool hasError;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(5.0),
          child: InputField(
              AppLocalizations.of(context).translate('EMAIL'),
              InputFieldTypes.EMAIL,
              update
          ),
        ),
        Container(
          padding: const EdgeInsets.all(5.0),
          child: InputField(
              AppLocalizations.of(context).translate('PASSWORD'),
              InputFieldTypes.PASSWORD,
              update
          ),
        ),
        Container(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            width: double.infinity,
            child: LoginButton(userData, handleError)
        ),
        Container(
          alignment: Alignment.centerRight,
          child: ForgotPasswordButton(),
        ),
        Visibility(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)
            ),
            color: Colors.redAccent,
            child: Container(
            padding: const EdgeInsets.all(10),
            child: Text(
              userData.errorMessage ?? '',
              style: TextStyle(
                color: Colors.black
              ),
            )
          )
          ),
          visible: hasError ?? false,
        )
      ],
    );
  }

  void update(String context, String data) {
    setState(() {
      hasError = false;

      if (context == InputFieldTypes.PASSWORD) {
        userData.password = data;
        return;
      }

      userData.email = data;
    });
  }

  void handleError() {
    setState(() {
      userData.errorMessage = AppLocalizations.of(context).translate('AUTH_ERROR');
      hasError = true;
    });
  }
}