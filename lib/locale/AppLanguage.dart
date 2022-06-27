import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  Locale _appLocale = Locale('en');
  late SharedPreferences preferences;

  Locale get appLocal => _appLocale;

  fetchLocale() async {
    preferences = await SharedPreferences.getInstance();
    String? currentLocale = preferences.getString('language_code');
    print('current applanguage' + currentLocale.toString());
    if (currentLocale == null) {
      _appLocale = Locale('hi');
      return Null;
    } else {
      _appLocale = Locale(preferences.getString('language_code')!);
    }
    return Null;
  }

  void changeLanguage(Locale type) async {
    preferences = await SharedPreferences.getInstance();
    if (_appLocale == type) {
      return;
    }
    if (type == Locale("hi")) {
      print("hindi block");
      _appLocale = Locale("hi");
      await preferences.setString('language_code', 'hi');
      await preferences.setString('countryCode', '');
    } else {
      _appLocale = Locale("en");
      await preferences.setString('language_code', 'en');
      await preferences.setString('countryCode', 'US');
    }
    notifyListeners();
  }
}
