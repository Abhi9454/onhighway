import 'package:flutter/cupertino.dart';
import '../helpers/enum.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/error_handler.dart';
import '../services/login_service.dart';


class LoginPageViewModel extends ChangeNotifier {
  AuthenticateService _authenticateService = new AuthenticateService();
  LoginStatus _loginStatus = LoginStatus.pending;

  LoginStatus get loginStatus => _loginStatus;


  late Map<String, dynamic> _userDetails;

  Map<String, dynamic> get userDetails => _userDetails;

  Future<void> _setUserDetails(Map<String, dynamic> userDetails) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    _userDetails = userDetails;
    if(_userDetails['success'] == 'false'){
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
      notifyListeners();
      _setUserDetails(await _authenticateService.login(email, password));
    } on ShowError catch (error) {
      _loginStatus = LoginStatus.error;
      _setError(error);
    }
    notifyListeners();
  }
}
