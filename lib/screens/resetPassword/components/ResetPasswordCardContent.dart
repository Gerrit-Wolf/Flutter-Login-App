import 'package:flutter/material.dart';
import 'package:test_app/components/inputField/InputField.dart';
import 'package:test_app/components/inputField/const/InputFieldTypes.dart';
import 'package:test_app/models/LoginUserData.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/services/AuthService.dart';
import 'package:test_app/shared/const/routes.dart';

class ResetPasswordCardContent extends StatefulWidget {
  @override
  ResetPasswordCardContentState createState() => ResetPasswordCardContentState();
}

class ResetPasswordCardContentState extends State<ResetPasswordCardContent> {
  LoginUserData userData = LoginUserData.empty();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(5.0),
          child: InputField(
              title: AppLocalizations.of(context).translate('EMAIL'),
              type: InputFieldTypes.EMAIL,
              userData: userData,
              onChanged: () {
                setState(() {});
              },
          ),
        ),
        Container(
            padding: const EdgeInsets.only(
              top: 10.0,
            ),
            width: double.infinity,
            child: RaisedButton(
              child: Text(
                AppLocalizations.of(context).translate('RESET_PASSWORD'),
              ),
              color: const Color(0xffb2bec3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              onPressed: () async {
                userData = await AuthService.resetPassword(userData);
                if (userData.resetPasswordSuccess == true) {
                  Navigator.pushNamed(context, Routes.LOGIN);
                  return;
                }
                userData.errorMessage = AppLocalizations.of(context).translate('AUTH_ERROR');

                setState(() {});
              },
            )
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
          visible: userData.errorMessage != null,
        )
      ],
    );
  }
}