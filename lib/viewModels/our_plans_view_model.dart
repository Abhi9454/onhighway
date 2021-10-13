import 'package:flutter/cupertino.dart';
import '../services/update_payment_service.dart';
import '../helpers/error_handler.dart';
import '../helpers/enum.dart';
import '../../helpers/read_user_details.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class OurPlansViewModel extends ChangeNotifier{

  final Razorpay razorpay = Razorpay();
  UserDetails _userDetails = new UserDetails();
  UpdatePaymentService _paymentService = new UpdatePaymentService();

  Status _status = Status.init;

  Status get status => _status;

  late ShowError _error;

  ShowError get error => _error;

  void _setError(ShowError error) {
    _error = error;
    notifyListeners();
  }

   late Map<String,dynamic> _paymentMessage;

  Map<String,dynamic>  get paymentMessage => _paymentMessage;

  Future<void> _setPaymentMessage(Map<String, dynamic> paymentMessage) async {
    _paymentMessage = paymentMessage;
    if (_paymentMessage['success'] == 'false') {
      _status = Status.failed;
    } else {
      _status = Status.success;
    }
    notifyListeners();
  }




  void openCheckout() async {
    var options = {
      'key': 'rzp_test_1DP5mmOlF5G5ag',
      'amount': 300000,
      'name': 'onHighway',
      'description': 'Joining Fees',
      'prefill': {'contact': await _userDetails.getUserMobile(), 'email': await _userDetails.getUserEmail()},
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


  updatePayment(String paymentId, String responseId) async {
    try {
      _status = Status.loading;
      notifyListeners();
      _setPaymentMessage(await _paymentService.updatePaymentSuccessful(await _userDetails.getId(), await _userDetails.getUserToken(), paymentId, responseId));
    } on ShowError catch (error) {
      _status = Status.error;
      _setError(error);
    }
    notifyListeners();
  }


  paymentFailed(){
    _status = Status.failed;
    notifyListeners();
  }
}