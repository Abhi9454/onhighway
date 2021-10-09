import 'package:flutter/material.dart';

class LanguageHelper {
  convertLangNameToLocale(String langNameToConvert) {
    Locale convertedLocale;

    switch (langNameToConvert) {
      case 'English':
        convertedLocale = Locale('en', 'US');
        break;
      case 'Hindi':
        convertedLocale = Locale('hi', 'IN');
        break;
      default:
        convertedLocale = Locale('en', 'EN');
    }

    return convertedLocale;
  }

  convertLocaleToLangName(String localeToConvert) {
    String langName;

    switch (localeToConvert) {
      case 'en':
        langName = 'English';
        break;
      case 'hi':
        langName = 'Hindi';
        break;
      default:
        langName = 'English';
    }

    return langName;
  }
}
