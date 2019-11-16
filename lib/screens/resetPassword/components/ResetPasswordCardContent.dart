import 'package:flutter/material.dart';
import 'package:test_app/components/inputField/InputField.dart';
import 'package:test_app/components/inputField/const/InputFieldTypes.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/services/AuthService.dart';
import 'package:test_app/shared/const/routes.dart';

class ResetPasswordCardContent extends StatefulWidget {
  @override
  ResetPasswordCardContentState createState() => ResetPasswordCardContentState();
}

class ResetPasswordCardContentState extends State<ResetPasswordCardContent> {
  String email;
  String errorMessage;
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
                await AuthService.resetPassword(email, handleError);
                Navigator.pushNamed(context, Routes.LOGIN);
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
                    errorMessage ?? '',
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
      email = data;
    });
  }

  void handleError() {
    setState(() {
      errorMessage = AppLocalizations.of(context).translate('AUTH_ERROR');
      hasError = true;
    });
  }
}