import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../helpers/enum.dart';



class AuthViewModel extends ChangeNotifier{

  Status _status  = Status.loading;

  Status get status => _status;


  loginStatus() async{
    SharedPreferences loginStatus = await SharedPreferences.getInstance();
    if(loginStatus.containsKey('userId')){
      _status = Status.success;
    }
    else{
      _status = Status.failed;
    }
    notifyListeners();
  }
}