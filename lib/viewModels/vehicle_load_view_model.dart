import 'package:flutter/cupertino.dart';
import '../models/vehicle_load.dart';
import '../services/view_load_service.dart';
import '../helpers/read_user_details.dart';
import '../helpers/enum.dart';
import '../helpers/error_handler.dart';

class VehicleLoadViewModel extends ChangeNotifier {
  VehicleLoadService _vehicleLoadService = new VehicleLoadService();
  UserDetails _userDetails = new UserDetails();
  Status _status = Status.init;

  Status get status => _status;

  List<VehicleLoad> _vehicleLoadDetails = [];

  List<VehicleLoad> get vehicleLoadDetails => _vehicleLoadDetails;

  Future<void> _setVehicleLoadDetails(
      List<VehicleLoad> vehicleLoadDetails) async {
    _vehicleLoadDetails = vehicleLoadDetails;
    _status = Status.success;
    notifyListeners();
  }

  late Map<String, dynamic> _serviceDeleteStatus;

  Map<String, dynamic> get serviceDeleteStatus => _serviceDeleteStatus;

  Future<void> _setAcceptLoad(
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
      _vehicleLoadDetails.clear();
      _setVehicleLoadDetails(await _vehicleLoadService.vehicleLoad(
          await _userDetails.getId(), await _userDetails.getUserToken()));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }

  deleteRequest(String id) async {
    try {
      _status = Status.loading;
      _setAcceptLoad(await _vehicleLoadService.acceptVehicleLoad(
          await _userDetails.getId(),
          await _userDetails.getUserToken(),
          id));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
