import 'dart:developer';

import 'package:flutter/cupertino.dart';
import '../services/notification.dart';
import '../services/register_service.dart';
import '../helpers/enum.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/error_handler.dart';

class RegisterPageViewModel extends ChangeNotifier {
  RegisterService _registerService = new RegisterService();
  RegisterStatus _registerStatus = RegisterStatus.pending;
  late String registerErrorMessage;
  final firebaseMessaging = FCM();

  RegisterStatus get registerStatus => _registerStatus;

  late Map<String, dynamic> _userDetails;

  Map<String, dynamic> get userDetails => _userDetails;

  Future<void> _setUserDetails(Map<String, dynamic> userDetails) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _userDetails = userDetails;
    if (_userDetails['success'] == 'false') {
      _registerStatus = RegisterStatus.failed;
      registerErrorMessage = _userDetails['message'];
      print(_userDetails.toString());
    } else {
      sharedPreferences.setString('userId', userDetails['userId'].toString());
      sharedPreferences.setString('userName', userDetails['userName']);
      sharedPreferences.setString('userMobile', userDetails['userMobile']);
      sharedPreferences.setString('userEmail', userDetails['userEmail']);
      sharedPreferences.setString('userToken', userDetails['userToken']);
      _registerStatus = RegisterStatus.success;
    }
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  register(
      String name, String email, String mobileNumber, String password) async {
    try {
      _registerStatus = RegisterStatus.loading;
      String token = await firebaseMessaging.getToken();
      log('the token is '+token);
      _setUserDetails(
          await _registerService.register(name, email, mobileNumber, password, token));
    } on ShowError catch (error) {
      _registerStatus = RegisterStatus.error;
      _setError(error);
    }
    notifyListeners();
  }
}
