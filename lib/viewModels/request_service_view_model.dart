import 'package:flutter/cupertino.dart';
import 'package:onhighway/models/service_type.dart';
import 'package:onhighway/models/vehicle_service_model.dart';
import '../helpers/read_user_details.dart';
import 'package:flutter/services.dart';
import '../helpers/error_handler.dart';
import '../helpers/enum.dart';
import 'dart:convert';
import '../services/request_service.dart';
import '../models/user_vehicle.dart';
import '../services/my_vehicles_service.dart';

class RequestServiceViewModel extends ChangeNotifier {
  RequestNewService _requestNewService = new RequestNewService();
  UserDetails _userDetails = new UserDetails();
  MyVehiclesListService _myVehiclesListService = new MyVehiclesListService();
  late String serviceAddErrorMessage;

  String latitudeLongitude = '';

  List<String> serviceType = [];

  List<String> serviceTypeSelectList = ['Select Service Type'];
  List<String> vehicleListName = ['Select Vehicle'];

  String selectedVehicleName = 'Select Vehicle';
  String selectedServiceType = 'Select Service Type';

  late List<UserVehicleModel> _vehicleDetails;

  List<UserVehicleModel> get vehicleDetails => _vehicleDetails;

  late List<VehicleServiceModel> _vehicleServicesList;

  List<VehicleServiceModel> get vehicleServicesList => _vehicleServicesList;

  Future<void> _setVehicleDetails(List<UserVehicleModel> vehicleDetails) async {
    _vehicleDetails = vehicleDetails;
    _status = Status.success;
    notifyListeners();
  }

  late String vehicleId;
  late String serviceRequestId;

  Status _status = Status.init;

  Status get status => _status;

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

  setLocation(String location) {
    _status = Status.loading;
    print('Location is ' + location);
    this.latitudeLongitude = location;
    _status = Status.success;
    notifyListeners();
  }

  late Map<String, dynamic> _serviceAddStatus;

  Map<String, dynamic> get serviceAddStatus => _serviceAddStatus;

  Future<void> _setServiceAdd(Map<String, dynamic> serviceAddStatus) async {
    _serviceAddStatus = serviceAddStatus;
    if (_serviceAddStatus['success'] == 'false') {
      _status = Status.errorResponse;
      serviceAddErrorMessage = _serviceAddStatus['message'];
    } else {
      _status = Status.trueResponse;
    }
    notifyListeners();
  }

  Future<void> _setVehicleServiceList(
      List<VehicleServiceModel> vehicleServices) async {
    _vehicleServicesList = vehicleServices;
    serviceTypeSelectList.clear();
    serviceTypeSelectList.add('Select Service Type');
    print("this is under service add function");
    for (int i = 0; i < _vehicleServicesList.length; i++) {
      serviceTypeSelectList.add(_vehicleServicesList[i].serviceTypeName);
    }
    //notifyListeners();
  }

  setVehicleId(String vehicleListName) async {
    _status = Status.loading;
    this.selectedVehicleName = vehicleListName;
    for (int i = 0; i < vehicleDetails.length; i++) {
      if (vehicleListName == vehicleDetails[i].vehicleListName) {
        this.vehicleId = vehicleDetails[i].vehicleId;
      }
    }
    await fetchVehicleServiceList();
    _status = Status.success;
    notifyListeners();
  }

  setServiceRequestId(String serviceTypeName) {
    _status = Status.loading;
    this.selectedServiceType = serviceTypeName;
    for (int i = 0; i < _vehicleServicesList.length; i++) {
      if (serviceTypeName == _vehicleServicesList[i].serviceTypeName) {
        this.serviceRequestId = _vehicleServicesList[i].serviceId;
      }
    }
    print('service request id is' + serviceRequestId);
    _status = Status.success;
    notifyListeners();
  }

  init() async {
    try {
      _status = Status.loading;
      // final String response =
      //     await rootBundle.loadString('assets/services.json');
      // final data = await json.decode(response);
      // serviceType = (data['serviceType'] as List)
      //     .map((e) => ServiceType.fromJson(e))
      //     .toList();
      // for (int i = 0; i < serviceType.length; i++) {
      //   serviceTypeSelectList.add(serviceType[i].name);
      // }
      _setVehicleDetails(await _myVehiclesListService.myVehiclesList(
          await _userDetails.getId(), await _userDetails.getUserToken()));
      for (int i = 0; i < vehicleDetails.length; i++) {
        if (vehicleDetails[i].vehicleStatus == 'Active') {
          vehicleListName.add(vehicleDetails[i].vehicleListName);
        }
      }
      _status = Status.success;
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }

  fetchVehicleServiceList() async {
    try {
      _status = Status.loading;
      _setVehicleServiceList(
        await _myVehiclesListService.vehicleServiceList(
          await _userDetails.getId(),
          await _userDetails.getUserToken(),
          vehicleId,
        ),
      );
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }

  serviceRequest(
      String serviceAddress, String serviceText, String pincode) async {
    try {
      _status = Status.loading;
      _setServiceAdd(
        await _requestNewService.requestService(
            await _userDetails.getId(),
            await _userDetails.getUserToken(),
            vehicleId,
            serviceRequestId,
            serviceAddress,
            serviceText,
            latitudeLongitude,
            pincode),
      );
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
