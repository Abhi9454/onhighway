import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../viewModels/our_plans_view_model.dart';
import '../../views/Widgets/app_head_logo_widget.dart';

class PlansBodyPageWidget extends StatelessWidget {
  PlansBodyPageWidget({required this.model});

  final OurPlansViewModel model;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    model.updatePayment(response.paymentId!, response.paymentId!);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    model.paymentFailed();
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    // Do something when an external wallet was selected
  }

  @override
  Widget build(BuildContext context) {
    model.razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    model.razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    model.razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
    return Column(
                children: [
                  AppHeadLogoWidget(),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      color: Colors.white70,
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'Joining Fees',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'WHEN ANYONE REGISTER THEIR TRUCK, BUS, CAR WITH OUR APP ALL SERVICES CAN REQUEST ONLY AFTER PAYING JOINING FEE WHICH IS ONE TIME FEE',
                              maxLines: 5,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 13),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                'Rs. 1499',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                'Vehicle Lifetime Register',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Center(
                              child: Text(
                                'Request Vehicle Service',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      color: Colors.white70,
                      elevation: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                'SERVICE CONTINUE FEE',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'FROM NEXT MONTH CUSTOMER WILL GET REMINDER FOR MAKING MONTHLY PAYMENT OF RS. 1000/- AND ITS MANDATORY TO PAY TO REQUEST FOR ANY SERVICE',
                              maxLines: 5,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontWeight: FontWeight.normal, fontSize: 13),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                'Rs. 999',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Center(
                              child: Text(
                                'Request Service Anytime',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Center(
                              child: Text(
                                'Request Service From Anywhere',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
  }
}
