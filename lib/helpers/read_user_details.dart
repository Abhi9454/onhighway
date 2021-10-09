import 'package:shared_preferences/shared_preferences.dart';

class UserDetails {
  late SharedPreferences preferences;

  Future<String> getId() async {
    preferences = await SharedPreferences.getInstance();
    String userId = preferences.getString('userId') ?? '';
    return userId;
  }

  Future<String> getUserToken() async {
    preferences = await SharedPreferences.getInstance();
    String userToken = preferences.getString('userToken') ?? '';
    return userToken;
  }

  Future<String> getUserName() async {
    preferences = await SharedPreferences.getInstance();
    String userName = preferences.getString('userName') ?? '';
    return userName;
  }

  Future<String> getUserEmail() async {
    preferences = await SharedPreferences.getInstance();
    String userEmail = preferences.getString('userEmail') ?? '';
    return userEmail;
  }

  Future<String> getUserMobile() async {
    preferences = await SharedPreferences.getInstance();
    String userMobile = preferences.getString('userMobile') ?? '';
    return userMobile;
  }
}
