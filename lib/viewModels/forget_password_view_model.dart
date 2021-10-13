import 'package:flutter/cupertino.dart';
import '../services/forget_password_service.dart';
import '../helpers/enum.dart';
import '../helpers/error_handler.dart';


class ForgetPasswordViewModel extends ChangeNotifier {
  ForgetPasswordService _forgetPasswordService = new ForgetPasswordService();
  LoginStatus _loginStatus = LoginStatus.pending;

  LoginStatus get loginStatus => _loginStatus;


  late Map<String, dynamic> _replyStatus;

  Map<String, dynamic> get replyStatus => _replyStatus;

  Future<void> _setReplyStatus(Map<String, dynamic> replyStatus) async {
    _replyStatus = replyStatus;
    if(_replyStatus['success'] == 'false'){
      _loginStatus = LoginStatus.failed;
    }
    else{
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

  forgetPassword(String email) async {
    try {
      _loginStatus = LoginStatus.loading;
      notifyListeners();
      _setReplyStatus(await _forgetPasswordService.sendRequest(email));
    } on ShowError catch (error) {
      _loginStatus = LoginStatus.error;
      _setError(error);
    }
    notifyListeners();
  }
}
