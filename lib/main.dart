import 'package:flutter/material.dart';
import 'package:test_app/screens/ResetPassword/index.dart';
import 'package:test_app/screens/home/index.dart';
import 'package:test_app/screens/signUp/index.dart';
import 'package:test_app/shared/const/routes.dart';
import 'screens/login/index.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter TestApp',
    routes: <String, WidgetBuilder>{
      Routes.LOGIN: (BuildContext context) => LoginScreenScaffold(),
      Routes.SIGN_UP: (BuildContext context) => SignUpScreenScaffold(),
      Routes.RESET_PASSWORD: (BuildContext context) => ResetPasswordScreenScaffold(),
      Routes.HOME: (BuildContext context) => HomeScreenScaffold(),
    },
  ));
}