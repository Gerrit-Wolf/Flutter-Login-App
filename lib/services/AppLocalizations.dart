import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations {
  AppLocalizations(this.locale, { this.testEnvironment = false });

  final Locale locale;
  final bool testEnvironment;

  static AppLocalizations of (BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();
  static const LocalizationsDelegate<AppLocalizations> delegateTestEnvironment = _AppLocalizationsDelegate(testEnvironment: true);

  Map<String, String> localizedString;

  Future<AppLocalizations> loadTest() async {
    return AppLocalizations(locale);
  }

  Future<bool> load() async {
    final String jsonString = await rootBundle.loadString('assets/lang/${locale.languageCode}.json');
    final Map<String, dynamic> jsonMap = json.decode(jsonString);

    localizedString = jsonMap.map((dynamic key, dynamic value) {
      return MapEntry<String, String>(key, value.toString());
    });

    return true;
  }

  String translate(String key) {
    if (testEnvironment == true) {
      return key;
    }

    return localizedString[key];
  }
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate({this.testEnvironment = false});

  final bool testEnvironment;

  @override
  bool isSupported(Locale locale) {
    final List<String> supportedLocales = <String> ['en', 'de'];
    return supportedLocales.contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async {
    final AppLocalizations localizations = AppLocalizations(locale, testEnvironment: testEnvironment);

    if (testEnvironment == true) {
      await localizations.loadTest();
    } else {
      await localizations.load();
    }

    return localizations;
  }

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}