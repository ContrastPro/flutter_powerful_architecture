class AppLocale {
  const AppLocale._();

  static const String pathLocale = 'assets/translations';

  // Locale when the locale is not in the list
  static const Locale fallbackLocale = Locale('en');

  // Overrides device locale.
  static const Locale startLocale = Locale('en');

  // List of supported locales.
  static const List<Locale> supportedLocales = [
    Locale('en'), // Английский
  ];
}