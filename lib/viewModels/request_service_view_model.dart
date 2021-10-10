import 'package:flutter/cupertino.dart';
import 'package:onhighway/models/service_type.dart';
import '../helpers/read_user_details.dart';
import '../models/service_request.dart';
import '../helpers/error_handler.dart';
import '../helpers/enum.dart';
import '../services/request_service.dart';

class RequestServiceViewModel extends ChangeNotifier {
  RequestNewService _requestNewService = new RequestNewService();
  UserDetails _userDetails = new UserDetails();
  late String serviceAddErrorMessage;

  List<ServiceType> serviceType = [];

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


  setVehicleId(String vehicleName){
    this.vehicleId = vehicleName;
    notifyListeners();
  }

  setServiceRequestId(String serviceTypeName){
    serviceRequestId = serviceTypeName;
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
