import 'package:flutter/cupertino.dart';
import '../models/user_vehicle.dart';
import '../helpers/read_user_details.dart';
import '../services/my_vehicles_service.dart';
import '../helpers/enum.dart';
import '../helpers/error_handler.dart';
import '../services/update_payment_service.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MyVehiclesListViewModel extends ChangeNotifier {
  final Razorpay razorpay = Razorpay();
  MyVehiclesListService _myVehiclesListService = new MyVehiclesListService();
  UserDetails _userDetails = new UserDetails();
  Status _status = Status.init;
  TransactionStatus _transactionStatus = TransactionStatus.init;
  UpdatePaymentService _paymentService = new UpdatePaymentService();

  String paymentTransactionId = '';

  Status get status => _status;
  TransactionStatus get transactionStatus => _transactionStatus;


  late List<UserVehicleModel> _vehicleDetails;

  List<UserVehicleModel> get vehicleDetails => _vehicleDetails;

  late Map<String, dynamic> _paymentMessage;

  Map<String, dynamic> get paymentMessage => _paymentMessage;

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
      _setVehicleDetails(await _myVehiclesListService.myVehiclesList(
          await _userDetails.getId(), await _userDetails.getUserToken()));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }


 late Map<String, dynamic> _initiatePaymentParameter;

  Map<String, dynamic> get initiatePaymentParameter => _initiatePaymentParameter;

  Future<void> _setInitiatePaymentDetails(Map<String, dynamic> initiatePaymentParameter) async {
    _initiatePaymentParameter = initiatePaymentParameter;
    if(_initiatePaymentParameter['success'] == 'true'){
      paymentTransactionId = _initiatePaymentParameter['paymentTxnId'];
      _status = Status.success;
    }
    else{
    _status = Status.failed;
    }
    notifyListeners();
  }
  


  initPayment(String vehicleId, String paymentType) async{

     try {
      _status = Status.loading;
      notifyListeners();
      _setInitiatePaymentDetails(await _myVehiclesListService.getTransactionId(
        await _userDetails.getId(),
        await _userDetails.getUserToken(),
        vehicleId,
        paymentType));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }

  void openCheckout(int paymentValue) async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': paymentValue * 100,
      'name': 'onHighway',
      'description': 'Joining Fees',
      'prefill': {
        'contact': await _userDetails.getUserMobile(),
        'email': await _userDetails.getUserEmail()
      },
      'external': {
        'wallets': ['paytm']
      }
    };
    try {
      razorpay.open(options);
    } catch (e) {
      debugPrint('Error: e');
    }
  }

  Future<void> _setPaymentMessage(Map<String, dynamic> paymentMessage) async {
    _paymentMessage = paymentMessage;
    if (_paymentMessage['success'] == 'false') {
      _status = Status.failed;
      _transactionStatus = TransactionStatus.failed;
    } else {
      _status = Status.success;
      _transactionStatus = TransactionStatus.success;
    }
    notifyListeners();
  }

  updatePayment(String gatewayTxnId) async {
    try {
      _status = Status.loading;
      notifyListeners();
      _setPaymentMessage(await _paymentService.updatePaymentSuccessful(
          await _userDetails.getId(),
          await _userDetails.getUserToken(),
          paymentTransactionId,
          gatewayTxnId));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }

  paymentFailed() {
    _status = Status.failed;
    _transactionStatus = TransactionStatus.failed;
    notifyListeners();
  }
}
