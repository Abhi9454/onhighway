import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../helpers/read_user_details.dart';
import '../models/vehicle_brands.dart';
import '../models/vehicle_models.dart';
import '../services/add_vehicle_service.dart';
import '../helpers/enum.dart';
import '../helpers/error_handler.dart';

class AddVehicleViewModel extends ChangeNotifier {
  AddVehicleService _addVehicleService = new AddVehicleService();
  UserDetails _userDetails = new UserDetails();
  String vehicleType = 'Select Vehicle Type';
  String vehicleFuelType = 'Select Fuel Type';
  late int selectedVehicleBrandId;
  late String selectedVehicleBrandName = 'Select Brand Name';
  late int selectedVehicleModelId;
  late String selectedVehicleModelName = 'Select Model Name';

  List<VehicleBrand> vehicleBrands = [];
  List<VehicleModel> vehicleModels = [];

  List<String> vehicleBrandsOnType = ['Select Brand Name'];
  List<String> vehicleModelOnType = ['Select Model Name'];
  Status _status = Status.init;

  Status get status => _status;
  late String vehicleAddErrorMessage;

  late Map<String, dynamic> _vehicleAddStatus;

  Map<String, dynamic> get vehicleAddStatus => _vehicleAddStatus;

  Future<void> _setVehicleAdd(Map<String, dynamic> vehicleAddStatus) async {
    _vehicleAddStatus = vehicleAddStatus;
    print(_vehicleAddStatus);
    if (_vehicleAddStatus['success'] == 'false') {
      _status = Status.failed;
      vehicleAddErrorMessage = _vehicleAddStatus['message'];
    } else {
      _status = Status.trueResponse;
    }
    notifyListeners();
  }

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  addVehicle(String vehicleNumber) async {
    print(selectedVehicleModelId.toString());
    try {
      _status = Status.loading;
      notifyListeners();
      _setVehicleAdd(
        await _addVehicleService.addVehicle(
            await _userDetails.getId(),
            await _userDetails.getUserToken(),
            vehicleType,
            selectedVehicleBrandId,
            selectedVehicleModelId,
            vehicleFuelType,
            vehicleNumber),
      );
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }

  setVehicleType(String vehicleType) {
    _status = Status.loading;
    vehicleBrandsOnType.clear();
    selectedVehicleBrandName = 'Select Brand Name';
    selectedVehicleModelName = 'Select Model Name';
    vehicleBrandsOnType.add('Select Brand Name');
    vehicleModelOnType.clear();
    vehicleModelOnType.add('Select Model Name');
    this.vehicleType = vehicleType;
    _status = Status.success;
    notifyListeners();
  }

  setVehicleFuelType(String vehicleFuelType) {
    this.vehicleFuelType = vehicleFuelType;
    notifyListeners();
  }

  setVehicleBrand(String vehicleBrand) {
    if (vehicleBrand != "Select Brand Name") {
      _status = Status.loading;
      vehicleModelOnType.clear();
      selectedVehicleModelName = 'Select Model Name';
      vehicleModelOnType.add('Select Model Name');
      for (int i = 0; i < vehicleBrands.length; i++) {
        if (vehicleBrands[i].brandName == vehicleBrand) {
          selectedVehicleBrandId = int.parse(vehicleBrands[i].brandId);
        }
      }
      this.selectedVehicleBrandName = vehicleBrand;
      _status = Status.success;
      notifyListeners();
    }
  }

  setVehicleModel(String vehicleModel) {
    if (vehicleModel != 'Select Model Name') {
      _status = Status.loading;
      for (int i = 0; i < vehicleModels.length; i++) {
        if (vehicleModels[i].modelName == vehicleModel) {
          selectedVehicleModelId = int.parse(vehicleModels[i].modelId);
        }
      }
      this.selectedVehicleModelName = vehicleModel;
      _status = Status.success;
      notifyListeners();
    }
  }

  fetchVehicleBrands() async {
    _status = Status.loading;
    vehicleBrands.clear();
    final String response =
        await rootBundle.loadString('assets/vehicle_brands.json');
    final data = await json.decode(response);
    vehicleBrands = (data['vehicleBrands'] as List)
        .map((e) => VehicleBrand.fromJson(e))
        .toList();
    for (int i = 0; i < vehicleBrands.length; i++) {
      if (vehicleBrands[i].vehicleType == vehicleType) {
        vehicleBrandsOnType.add(vehicleBrands[i].brandName);
      }
    }
    _status = Status.success;
    notifyListeners();
  }

  fetchVehicleModel() async {
    _status = Status.loading;
    vehicleModels.clear();
    final String response =
        await rootBundle.loadString('assets/vehicle_models.json');
    final data = await json.decode(response);
    vehicleModels = (data['vehicleModels'] as List)
        .map((e) => VehicleModel.fromJson(e))
        .toList();
    for (int i = 0; i < vehicleModels.length; i++) {
      if (vehicleModels[i].vehicleType == vehicleType &&
          vehicleModels[i].modelBrandId == selectedVehicleBrandId.toString()) {
        vehicleModelOnType.add(vehicleModels[i].modelName);
      }
    }
    _status = Status.success;
    notifyListeners();
  }
}
