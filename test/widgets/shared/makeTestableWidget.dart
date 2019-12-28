import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_app/services/AppLocalizations.dart';

Widget makeTestableWidget({ Widget child }) {
  return MaterialApp(
    localizationsDelegates: <LocalizationsDelegate<dynamic>>[
      AppLocalizations.delegateTestEnvironment,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    home: child,
  );
}