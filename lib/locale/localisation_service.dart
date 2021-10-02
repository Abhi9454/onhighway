import 'dart:ui';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'en_us.dart';
import 'hi_in.dart';

class LocalizationService extends Translations {
  final _box = GetStorage();


  Locale? getCurrentLocale(){
    String currentLocale = _box.read('locale');
    final locale = _getLocaleFromLanguage(currentLocale);
    return locale;
  }

  static final locale = Locale('hi', 'IN');




  static final languages = [
    'English',
    'Hindi',
  ];

  static final locales = [
    Locale('en', 'US'),
    Locale('hi', 'IN'),
  ];

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': enUS, // lang/en_us.dart
        'hi_IN': hiIn, // lang/tr_tr.dart
      };

  void changeLocale(String lang) {
    final locale = _getLocaleFromLanguage(lang);
    Get.updateLocale(locale!);
    _box.write("locale", lang);
  }

  Locale? _getLocaleFromLanguage(String lang) {
    for (int i = 0; i < languages.length; i++) {
      if (lang == languages[i]) return locales[i];
    }
    return Get.locale;
  }
}
