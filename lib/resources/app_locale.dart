import 'package:flutter/material.dart';

class AppLocale {
  const AppLocale._();

  static const String path = 'assets/translations';

  // Locale when the locale is not in the list
  static const Locale fallbackLocale = Locale('en', 'US');

  // Overrides device locale.
  static const Locale startLocale = Locale('en', 'US');

  // List of supported locales.
  static const List<Locale> supportedLocales = [
    Locale('en', 'US'), // English
    Locale('ru', 'RU'), // Russian
  ];
}
