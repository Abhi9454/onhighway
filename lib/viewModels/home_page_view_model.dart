import 'package:flutter/cupertino.dart';
import 'package:onhighway/helpers/error_handler.dart';
import 'package:onhighway/services/home_page_service.dart';
import '../locale/AppLanguage.dart';
import '../helpers/read_user_details.dart';
import '../helpers/enum.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePageViewModel extends ChangeNotifier {
  late SharedPreferences preferences;
  HomePageService _homePageService = new HomePageService();
  UserDetails _userDetails = new UserDetails();

  int totalPendingAmount = 0;

  Status _status = Status.init;

  Status get status => _status;

  late String currentLocale;

  HomePageUserStatus _userStatus = HomePageUserStatus.pendingVerification;

  HomePageUserStatus get userStatus => _userStatus;

  late Map<String, dynamic> _pendingPayments;

  Map<String, dynamic> get pendingPayment => _pendingPayments;

  Future<void> _setPendingPayment(Map<String, dynamic> pendingPayments) async {
    _pendingPayments = pendingPayments;
    print('in function' + _pendingPayments['success'] );
    if (_pendingPayments['success'] == 'true') {
      this.totalPendingAmount = _pendingPayments['total_pending_amt'];
      _status = Status.success;
    } else {
      _status = Status.errorResponse;
    }
    notifyListeners();
  }

  init() async {
    String userId = await _userDetails.getId();
    if (userId.isEmpty) {
      _userStatus = HomePageUserStatus.userNotVerified;
    }
    notifyListeners();
  }

  Future<String> getCurrentLocale() async {
    preferences = await SharedPreferences.getInstance();
    currentLocale = preferences.getString('language_code').toString();
    return currentLocale;
  }

  changeLanguage(Locale locale) async {
    AppLanguage _appLanguage = new AppLanguage();
    _appLanguage.changeLanguage(locale);
    notifyListeners();
  }

  logout() async {
    preferences = await SharedPreferences.getInstance();
    preferences.clear();
    _userStatus = HomePageUserStatus.userNotVerified;
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  pendingPayments() async {
    try {
      _status = Status.loading;
      _setPendingPayment(await _homePageService.pendingPayment(
          await _userDetails.getId(), await _userDetails.getUserToken()));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
