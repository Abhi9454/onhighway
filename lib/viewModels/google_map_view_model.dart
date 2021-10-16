import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GoogleMapViewModel extends ChangeNotifier {
  late SharedPreferences preferences;

  updateLocation(String location) async {
    preferences = await SharedPreferences.getInstance();
    preferences.setString('location', location);
    notifyListeners();
  }
}
