import 'dart:developer';

import 'package:flutter/cupertino.dart';
import '../helpers/enum.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/error_handler.dart';
import '../services/login_service.dart';
import '../services/notification.dart';


class LoginPageViewModel extends ChangeNotifier {
  AuthenticateService _authenticateService = new AuthenticateService();
  LoginStatus _loginStatus = LoginStatus.pending;
  String errorMessage = '';
  final firebaseMessaging = FCM();

  LoginStatus get loginStatus => _loginStatus;


  late Map<String, dynamic> _userDetails;

  Map<String, dynamic> get userDetails => _userDetails;

  Future<void> _setUserDetails(Map<String, dynamic> userDetails) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _userDetails = userDetails;
    print(_userDetails);
    if(_userDetails['success'] == 'false'){
      errorMessage = _userDetails['message'];
      _loginStatus = LoginStatus.failed;
    }
    else{
     sharedPreferences.setString('userId', userDetails['userId']);
     sharedPreferences.setString('userName', userDetails['userName']);
     sharedPreferences.setString('userMobile', userDetails['userMobile']);
     sharedPreferences.setString('userEmail', userDetails['userEmail']);
     sharedPreferences.setString('userToken', userDetails['userToken']);
     sharedPreferences.setString('userStatus', userDetails['userStatus']);
     _loginStatus = LoginStatus.success;
    }
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  login(String email, String password) async {
    try {
      _loginStatus = LoginStatus.loading;
      String token = await firebaseMessaging.getToken();
      firebaseMessaging.setNotification();
      log('the token is '+token);
      _setUserDetails(await _authenticateService.login(email, password, token));
    } on ShowError catch (error) {
      _loginStatus = LoginStatus.error;
      _setError(error);
    }
    notifyListeners();
  }
}
