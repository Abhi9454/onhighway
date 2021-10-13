import 'package:flutter/cupertino.dart';
import '../models/running_service.dart';
import '/services/running_service.dart';
import '../helpers/read_user_details.dart';
import '../helpers/enum.dart';
import '../helpers/error_handler.dart';

class RunningServiceViewModel extends ChangeNotifier {
  RunningService _runningService = new RunningService();
  UserDetails _userDetails = new UserDetails();
  Status _status = Status.init;

  Status get status => _status;

  List<UserRunningService> _serviceDetails = [];

  List<UserRunningService> get serviceDetails => _serviceDetails;

  Future<void> _setRunningServiceDetails(
      List<UserRunningService> serviceDetails) async {
    _serviceDetails = serviceDetails;
    _status = Status.success;
    notifyListeners();
  }

  late Map<String, dynamic> _serviceDeleteStatus;

  Map<String, dynamic> get serviceDeleteStatus => _serviceDeleteStatus;

  Future<void> _setDeleteServiceRequest(
      Map<String, dynamic> serviceDeleteStatus) async {
    _serviceDeleteStatus = serviceDeleteStatus;
    if (_serviceDeleteStatus['success'] == false) {
      _status = Status.failed;
    } else {
      _status = Status.success;
      fetchList();
    }
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
      _serviceDetails.clear();
      _setRunningServiceDetails(await _runningService.runningService(
          await _userDetails.getId(), await _userDetails.getUserToken()));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }

  deleteRequest(String serviceRequestId) async {
    try {
      _status = Status.loading;
      _setDeleteServiceRequest(await _runningService.deleteRunningService(
          await _userDetails.getId(),
          await _userDetails.getUserToken(),
          serviceRequestId));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
