import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test_app/screens/home/index.dart';
import 'package:test_app/screens/main/index.dart';
import 'package:test_app/screens/register/index.dart';
import 'package:test_app/screens/resetPassword/index.dart';
import 'package:test_app/services/AppLocalizations.dart';
import 'package:test_app/shared/const/routes.dart';
import 'screens/login/index.dart';

void main() {
  runApp(MaterialApp(
    localizationsDelegates: <LocalizationsDelegate<dynamic>>[
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
      Routes.HOME: (BuildContext context) => HomeScreen(),
      Routes.LOGIN: (BuildContext context) => LoginScreen(),
      Routes.REGISTER: (BuildContext context) => RegisterScreen(),
      Routes.RESET_PASSWORD: (BuildContext context) => ResetPasswordScreen(),
      Routes.MAIN: (BuildContext context) => MainScreen(),
    },
  ));
}