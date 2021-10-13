import 'package:flutter/cupertino.dart';
import '../helpers/read_user_details.dart';
import '../helpers/enum.dart';
import '../models/user_profile_model.dart';

class MyProfileViewModel extends ChangeNotifier{

  UserDetails _userDetails = new UserDetails();

  Status _status = Status.init;

  Status get status => _status;

  late UserProfile _userProfile;

  UserProfile get userProfile => _userProfile;

  Future<void> _setUserProfile(UserProfile userProfile) async {
    _userProfile = userProfile;
    _status = Status.success;
    notifyListeners();
  }

  fetchUserProfile() async {
    _status = Status.loading;
    _setUserProfile(UserProfile(userId: await _userDetails.getId(), userName: await _userDetails.getUserName(), userEmail: await _userDetails.getUserEmail(), userMobile: await _userDetails.getUserMobile(), userProfileLink: ''));

  }
}