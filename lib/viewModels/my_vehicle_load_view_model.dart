import 'package:flutter/cupertino.dart';
import '../models/vehicle_load.dart';
import '../services/view_load_service.dart';
import '../helpers/read_user_details.dart';
import '../helpers/enum.dart';
import '../helpers/error_handler.dart';

class MyVehicleLoadViewModel extends ChangeNotifier {
  VehicleLoadService _vehicleLoadService = new VehicleLoadService();
  UserDetails _userDetails = new UserDetails();
  Status _status = Status.init;

  Status get status => _status;

  List<VehicleLoad> _myVehicleLoadDetails = [];

  List<VehicleLoad> get myVehicleLoadDetails => _myVehicleLoadDetails;

  Future<void> _setVehicleLoadDetails(
      List<VehicleLoad> myVehicleLoadDetails) async {
    _myVehicleLoadDetails = myVehicleLoadDetails;
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
      myVehicleLoadDetails.clear();
      _setVehicleLoadDetails(await _vehicleLoadService.myVehicleLoad(
          await _userDetails.getId(), await _userDetails.getUserToken()));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
