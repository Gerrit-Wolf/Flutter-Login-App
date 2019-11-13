import 'package:flutter/material.dart';
import 'package:test_app/screens/signUp/index.dart';
import 'screens/login/index.dart';

void main() async {
  runApp(MaterialApp(
    title: 'My app', // used by the OS task switcher
    routes: {
      '/': (context) => LoginScreenScaffold(),
      '/signUp': (context) => SignUpScreenScaffold(),
    },
  ));
}