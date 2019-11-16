import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_app/screens/ResetPassword/index.dart';
import 'package:test_app/screens/home/index.dart';
import 'package:test_app/screens/signUp/index.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/shared/const/routes.dart';
import 'screens/login/index.dart';

void main() {
  runApp(MaterialApp(
    // ignore: always_specify_types
    localizationsDelegates: [
      AppLocalizations.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
    ],
    supportedLocales: const <Locale>[
      Locale('en', 'US'),
      Locale('de', 'DE'),
    ],
    localeResolutionCallback: (Locale locale, Iterable<Locale> supportedLocales) {
      for (Locale supportedLocale in supportedLocales) {
        if (supportedLocale.languageCode == locale.languageCode &&
        supportedLocale.countryCode == locale.countryCode) {
          return supportedLocale;
        }
      }
      return supportedLocales.first;
    },
    title: 'Flutter TestApp',
    routes: <String, WidgetBuilder>{
      Routes.LOGIN: (BuildContext context) => LoginScreenScaffold(),
      Routes.SIGN_UP: (BuildContext context) => SignUpScreenScaffold(),
      Routes.RESET_PASSWORD: (BuildContext context) => ResetPasswordScreenScaffold(),
      Routes.HOME: (BuildContext context) => HomeScreenScaffold(),
    },
  ));
}