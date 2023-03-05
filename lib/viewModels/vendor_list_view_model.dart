import 'package:flutter/cupertino.dart';
import 'package:location/location.dart';
import 'package:onhighway/models/vendor_model.dart';
import 'package:onhighway/services/vendor_service.dart';

import '../helpers/enum.dart';
import '../helpers/error_handler.dart';
import '../helpers/read_user_details.dart';

class VendorListViewModel extends ChangeNotifier{
  VendorListService _vendorListService = new VendorListService();
  UserDetails _userDetails = new UserDetails();
  Status _status = Status.init;
  String userLat = '';
  String userLon = '';
  String vehicleType = '';
  String serviceType = '';
  late LocationData _currentPosition;
  String _address = '';
  Location location = new Location();

  Status get status => _status;

  List<VendorModel> _vendorList = [];

  List<VendorModel> get vendorList => _vendorList;

  Future<void> _setVendorList(
      List<VendorModel> vendorList) async {
    print("vendor list" + vendorList.toString());
    _vendorList = vendorList;
    _status = Status.success;
    notifyListeners();
  }

  fetchLocation() async {
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _currentPosition = await location.getLocation();
    userLat = _currentPosition.latitude.toString();
    userLon = _currentPosition.longitude.toString();
    print(userLat + ',' + userLon);
    fetchList();
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
      _vendorList.clear();
      _setVendorList(await _vendorListService.getVendorList(userLat, userLon,
          vehicleType, serviceType));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }
}