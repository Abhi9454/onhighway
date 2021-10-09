import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show SynchronousFuture;

class AppLocalization {
  AppLocalization(this.locale);

  final Locale locale;

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'signIn': 'Sign In',
      'signUp': 'Sign Up',
      'myProfile': 'My Profile',
      'serviceHistory': 'Service History',
      'changeLanguage': 'Change Language',
      'paymentPending': 'Pending Payment',
      'payNow': 'Pay Now',
      'requestService': 'Request a new service',
      'runningService': 'Running services',
      'addVehicle': 'Add a new vehicle',
      'myVehicle': 'My Vehicles',
      'visitWebsite': 'Visit Website',
      'contactSupport': 'Contact Support',
      'plansFeatures': 'Plans and Features',
      'chooseService': 'Choose Service'
    },
    'hi': {
      'signIn': 'लॉगइन करें',
      'signUp': 'रजिस्टर करें',
      'myProfile': 'मेरी प्रोफाइल',
      'serviceHistory': 'पिछले विवरण',
      'changeLanguage': 'भाषा चुनें',
      'paymentPending': 'बकाया राशि',
      'payNow': 'अभी भुगतान करें',
      'requestService': 'नयी सेवा का अनुरोध करें',
      'runningService': 'अनुरोध सेवा',
      'addVehicle': 'नया वाहन जोड़ें',
      'myVehicle': 'मेर वाहन',
      'visitWebsite': 'वेबसाइट',
      'contactSupport': 'हमसे संपर्क करें',
      'plansFeatures': 'योजनाएं और विशेषताएं',
      'chooseService': 'सेवाओं का चयन करें'
    },
  };

  String translate(String key) {
    return _localizedValues[locale.languageCode]![key] ?? '** $key not found';
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'hi'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    // Returning a SynchronousFuture here because an async "load" operation
    // isn't needed to produce an instance of DemoLocalizations.
    return SynchronousFuture<AppLocalization>(
      AppLocalization(locale),
    );
  }

  @override
  bool shouldReload(AppLocalizationDelegate old) => false;
}
