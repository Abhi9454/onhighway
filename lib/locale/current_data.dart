import 'package:flutter/material.dart';
import 'language_helper.dart';

class CurrentData with ChangeNotifier {
  late String currentLanguage;
  Locale locale = Locale('en', 'US');

  LanguageHelper languageHelper = LanguageHelper();

  Locale get getLocale => locale;

  void changeLocale(String newLocale) {
    Locale convertedLocale;

    currentLanguage = newLocale;

    convertedLocale = languageHelper.convertLangNameToLocale(newLocale);
    locale = convertedLocale;
    notifyListeners();
  }

  defineCurrentLanguage(context) {
    String definedCurrentLanguage;

    if (currentLanguage.isNotEmpty)
      definedCurrentLanguage = currentLanguage;
    else {
      print(
          "locale from currentData: ${Localizations.localeOf(context).toString()}");
      definedCurrentLanguage = languageHelper
          .convertLocaleToLangName(Localizations.localeOf(context).toString());
    }

    return definedCurrentLanguage;
  }
}