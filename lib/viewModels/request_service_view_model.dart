import 'package:flutter/cupertino.dart';
import 'package:onhighway/models/service_type.dart';
import '../helpers/read_user_details.dart';
import '../models/service_request.dart';
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

  List<ServiceType> serviceType = [];

  List<String> serviceTypeSelectList = ['Select Service Type'];
  List<String> vehicleListName = ['Select Vehicle'];

  String selectedVehicleName = 'Select Vehicle';
  String selectedServiceType = 'Select Service Type';

  late List<UserVehicleModel> _vehicleDetails;

  List<UserVehicleModel> get vehicleDetails => _vehicleDetails;

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

  late List<ServiceRequest> _serviceAddStatus;

  List<ServiceRequest> get serviceAddStatus => _serviceAddStatus;

  Future<void> _setServiceAdd(List<ServiceRequest> serviceAddStatus) async {
    _serviceAddStatus = serviceAddStatus;
    if (_serviceAddStatus.isEmpty) {
      _status = Status.failed;
      serviceAddErrorMessage = 'Error Adding service';
    } else {
      _status = Status.trueResponse;
    }
    notifyListeners();
  }

  setVehicleId(String vehicleListName) {
    _status = Status.loading;
    serviceType.clear();
    this.selectedVehicleName = vehicleListName;
    for (int i = 0; i < vehicleDetails.length; i++) {
      if (vehicleListName == vehicleDetails[i].vehicleListName) {
        this.vehicleId = vehicleDetails[i].vehicleId;
      }
    }
    _status = Status.success;
    notifyListeners();
  }

  setServiceRequestId(String serviceTypeName) {
    _status = Status.loading;
    this.selectedServiceType = serviceTypeName;
    for (int i = 0; i < serviceType.length; i++) {
      if (serviceTypeName == serviceType[i].name) {
        this.serviceRequestId = serviceType[i].id;
      }
    }
    _status = Status.success;
    notifyListeners();
  }

  init() async {
    try {
      _status = Status.loading;
      final String response =
          await rootBundle.loadString('assets/services.json');
      final data = await json.decode(response);
      serviceType = (data['serviceType'] as List)
          .map((e) => ServiceType.fromJson(e))
          .toList();
      for (int i = 0; i < serviceType.length; i++) {
        serviceTypeSelectList.add(serviceType[i].name);
      }
      _setVehicleDetails(await _myVehiclesListService.myVehiclesList(
          await _userDetails.getId(), await _userDetails.getUserToken()));
      for (int i = 0; i < vehicleDetails.length; i++) {
        vehicleListName.add(vehicleDetails[i].vehicleListName);
      }
      _status = Status.success;
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }

  serviceRequest(
      String serviceAddress, String serviceText, String serviceLatLng) async {
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
            serviceLatLng),
      );
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}
