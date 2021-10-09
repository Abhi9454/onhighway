import 'package:flutter/cupertino.dart';
import '../models/user_vehicle.dart';
import '../helpers/read_user_details.dart';
import '../services/my_vehicles_service.dart';
import '../helpers/enum.dart';
import '../helpers/error_handler.dart';


class MyVehiclesListViewModel extends ChangeNotifier {
  MyVehiclesListService _myVehiclesListService = new MyVehiclesListService();
  UserDetails _userDetails = new UserDetails();
  Status _status = Status.init;

  Status get status => _status;


  late List<UserVehicleModel> _vehicleDetails;

  List<UserVehicleModel> get vehicleDetails => _vehicleDetails;

  Future<void> _setVehicleDetails(List<UserVehicleModel> vehicleDetails) async {
    _vehicleDetails = vehicleDetails;
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
      _setVehicleDetails(await _myVehiclesListService.myVehiclesList(await _userDetails.getId(), await _userDetails.getUserToken()));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
