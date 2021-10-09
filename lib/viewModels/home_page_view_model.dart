import 'package:flutter/cupertino.dart';
import 'package:onhighway/locale/current_data.dart';
import '../helpers/read_user_details.dart';
import '../helpers/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageViewModel extends ChangeNotifier {
  late SharedPreferences _preferences;
  UserDetails _userDetails = new UserDetails();

  late Locale currentLocale ;
  CurrentData _currentData = new CurrentData();
  HomePageUserStatus _userStatus = HomePageUserStatus.pendingVerification;

  HomePageUserStatus get userStatus => _userStatus;

  init() async{
    String userId = await _userDetails.getId();
    if(userId.isEmpty){
      _userStatus = HomePageUserStatus.userNotVerified;
    }
    notifyListeners();
  }

  changeLocale(String language){
    _currentData.changeLocale(language);
    notifyListeners();
  }

  Locale getCurrentLocale(){
    currentLocale = _currentData.getLocale;
    return currentLocale;
  }

  logout() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.clear();
    _userStatus = HomePageUserStatus.userNotVerified;
    notifyListeners();
  }
}
