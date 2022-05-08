import 'package:flutter/material.dart';
import 'package:locale_app/l10n/l10n.dart';

class LanguageProvider extends ChangeNotifier {
  String _languageCode = 'en';
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  void saveLocale(String locale) {
    if (!L10n.all.contains(Locale(locale))) return;
    _locale = Locale(locale);
    _languageCode = locale;
    notifyListeners();
  }

  String get language => _languageCode;
}
