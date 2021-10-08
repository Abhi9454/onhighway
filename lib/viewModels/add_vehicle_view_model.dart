import 'package:flutter/cupertino.dart';
import '../models/brand_model.dart';
import '../services/add_vehicle_service.dart';
import '../helpers/enum.dart';
import '../helpers/error_handler.dart';

class AddVehicleViewModel extends ChangeNotifier {
  AddVehicleService _addVehicleService = new AddVehicleService();
  late List<BrandModel> _vehicleBrandList;
  late Map<int, String> _vehicleModelList;
  Status _status = Status.loading;

  Status get status => _status;
  late String vehicleAddErrorMessage;

  late Map<String, dynamic> _vehicleAddStatus;

  Map<String, dynamic> get vehicleAddStatus => _vehicleAddStatus;

  List<BrandModel> get vehicleBrandList => _vehicleBrandList;

  Map<int, String> get vehicleModelList => _vehicleModelList;

  Future<void> _setVehicleAdd(Map<String, dynamic> vehicleAddStatus) async {
    _vehicleAddStatus = vehicleAddStatus;
    if (_vehicleAddStatus['success'] == 'false') {
      _status = Status.failed;
      vehicleAddErrorMessage = _vehicleAddStatus['message'];
    } else {
      _status = Status.success;
    }
    notifyListeners();
  }

  Future<void> _setVehicleBrandList(List<BrandModel> vehicleBrandList) async {
    _vehicleBrandList = vehicleBrandList;
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  addVehicle(int userId, String userToken, String vehicleType, int vehicleBrand,
      int vehicleModel, String vehicleFuelType, String vehicleNumber) async {
    try {
      _status = Status.loading;
      notifyListeners();
      _setVehicleAdd(await _addVehicleService.addVehicle(
          userId,
          userToken,
          vehicleType,
          vehicleBrand,
          vehicleModel,
          vehicleFuelType,
          vehicleNumber));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }

  _fetchVehicleBrandList(String vehicleType) async {
    try {
      _status = Status.loading;
      notifyListeners();
      _setVehicleBrandList(
          await _addVehicleService.getVehicleBrandId(vehicleType));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
