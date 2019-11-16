import 'package:flutter/material.dart';
import 'package:test_app/components/inputField/const/InputFieldTypes.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/services/AuthService.dart';
import 'package:test_app/shared/const/routes.dart';
import '../../../components/inputField/InputField.dart';

class SignUpCardContent extends StatefulWidget {
  @override
  SignUpCardContentState createState() => SignUpCardContentState();
}

class SignUpCardContentState extends State<SignUpCardContent> {
  String email;
  String password;
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
            child: RaisedButton(
              child: Text(
                AppLocalizations.of(context).translate('SIGN_UP'),
              ),
              color: const Color(0xffb2bec3),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              onPressed: () async {
                final bool signUpSuccess = await AuthService.signUp(email, password, handleError);

                if (signUpSuccess == true) {
                  Navigator.pushNamed(context, Routes.HOME);
                }
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

      if (context == InputFieldTypes.PASSWORD) {
        password = data;
        return;
      }

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