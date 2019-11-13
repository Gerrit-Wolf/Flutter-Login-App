import 'package:flutter/material.dart';
import 'package:test_app/screens/signUp/index.dart';
import 'screens/login/index.dart';

void main() {
  runApp(MaterialApp(
    title: 'Flutter TestApp',
    routes: <String, WidgetBuilder>{
      '/': (BuildContext context) => LoginScreenScaffold(),
      '/signUp': (BuildContext context) => SignUpScreenScaffold(),
    },
  ));
}