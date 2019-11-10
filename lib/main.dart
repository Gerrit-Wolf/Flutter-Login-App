import 'package:flutter/material.dart';
import 'screens/login/index.dart';

void main() {
  runApp(MaterialApp(
    title: 'My app', // used by the OS task switcher
    home: LoginScreenScaffold(),
  ));
}