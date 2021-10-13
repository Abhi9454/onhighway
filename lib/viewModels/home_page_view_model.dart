import 'package:flutter/cupertino.dart';
import '../locale/AppLanguage.dart';
import '../helpers/read_user_details.dart';
import '../helpers/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageViewModel extends ChangeNotifier {
  late SharedPreferences _preferences;
  UserDetails _userDetails = new UserDetails();

  late String currentLocale;

  HomePageUserStatus _userStatus = HomePageUserStatus.pendingVerification;

  HomePageUserStatus get userStatus => _userStatus;

  init() async{
    String userId = await _userDetails.getId();
    if(userId.isEmpty){
      _userStatus = HomePageUserStatus.userNotVerified;
    }
    notifyListeners();
  }

  Future<String> getCurrentLocale() async{
    _preferences = await SharedPreferences.getInstance();
    currentLocale =  _preferences.getString('language_code').toString();
    return currentLocale;
  }

  changeLanguage(Locale locale) async{
    AppLanguage _appLanguage = new AppLanguage();
    _appLanguage.changeLanguage(locale);
    notifyListeners();
  }

  logout() async {
    _preferences = await SharedPreferences.getInstance();
    _preferences.clear();
    _userStatus = HomePageUserStatus.userNotVerified;
    notifyListeners();
  }
}
