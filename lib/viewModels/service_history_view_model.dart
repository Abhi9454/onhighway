import 'package:flutter/cupertino.dart';
import '../models/user_service.dart';
import '../services/service_history_service.dart';
import '../helpers/read_user_details.dart';
import '../helpers/enum.dart';
import '../helpers/error_handler.dart';

class ServiceHistoryViewModel extends ChangeNotifier {
  ServiceHistory _serviceHistory = new ServiceHistory();
  UserDetails _userDetails = new UserDetails();
  Status _status = Status.init;

  Status get status => _status;

  late List<UserServiceModel> _serviceDetails;

  List<UserServiceModel> get serviceDetails => _serviceDetails;

  Future<void> _setServiceDetails(List<UserServiceModel> serviceDetails) async {
    _serviceDetails = serviceDetails;
    _status = Status.success;
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  fetchList() async {
    try {
      _status = Status.loading;
      _setServiceDetails(await _serviceHistory.serviceHistory(
          await _userDetails.getId(), await _userDetails.getUserToken()));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
