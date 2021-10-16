import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../viewModels/my_vehicles_view_model.dart';
import '../MyVehiclesPage/Widget/my_vehicle_list_view_container.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class MyVehicleBodyPageWidget extends StatelessWidget {
  MyVehicleBodyPageWidget(
      {required this.addVehicleContext, required this.myVehicleModel});

  final BuildContext addVehicleContext;
  final MyVehiclesListViewModel myVehicleModel;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    myVehicleModel.updatePayment(response.paymentId!);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    myVehicleModel.paymentFailed();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  Widget build(BuildContext context) {
    myVehicleModel.razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    myVehicleModel.razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    myVehicleModel.razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    return ListView.builder(
        itemCount: myVehicleModel.vehicleDetails.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return MyVehicleListViewContainer(
            myVehicleModel : myVehicleModel.vehicleDetails[index],
            myVehicleViewModel: myVehicleModel,
          );
        });
  }
}
