import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import '../../locale/app_localization.dart';
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
                                '₹ 499/- for 3 months',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            // Center(
                            //   child: Text(
                            //     AppLocalizations.of(context)!.translate('lifeTimeRegister')!,
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold, fontSize: 15),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 2,
                            // ),
                            // Center(
                            //   child: Text(
                            //     AppLocalizations.of(context)!.translate('requestVehicleService')!,
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold, fontSize: 15),
                            //   ),
                            // ),
                            Text(
                              '- Request for service',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              '- Get truck load requests',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              '- Manage all your vehicles at one place',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              '- Find service provider nearby',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.all(10.0),
                  //   child: Card(
                  //     color: Colors.white70,
                  //     elevation: 2,
                  //     child: Padding(
                  //       padding: const EdgeInsets.all(15.0),
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         children: [
                  //           Center(
                  //             child: Text(
                  //               AppLocalizations.of(context)!.translate('serviceFees')!,
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.bold, fontSize: 18),
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             height: 10,
                  //           ),
                  //           Text(
                  //             AppLocalizations.of(context)!.translate('serviceContinueText')!,
                  //             maxLines: 5,
                  //             textAlign: TextAlign.center,
                  //             style: TextStyle(
                  //                 fontWeight: FontWeight.normal, fontSize: 13),
                  //           ),
                  //           const SizedBox(
                  //             height: 5,
                  //           ),
                  //           Center(
                  //             child: Text(
                  //               'Rs. 999',
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.bold, fontSize: 20),
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             height: 5,
                  //           ),
                  //           Center(
                  //             child: Text(
                  //               AppLocalizations.of(context)!.translate('requestServiceAnytime')!,
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.bold, fontSize: 15),
                  //             ),
                  //           ),
                  //           const SizedBox(
                  //             height: 2,
                  //           ),
                  //           Center(
                  //             child: Text(
                  //               AppLocalizations.of(context)!.translate('requestServiceAnywhere')!,
                  //               style: TextStyle(
                  //                   fontWeight: FontWeight.bold, fontSize: 15),
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // )
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
                                '₹ 999/- for 6 months',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            // Center(
                            //   child: Text(
                            //     AppLocalizations.of(context)!.translate('lifeTimeRegister')!,
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold, fontSize: 15),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 2,
                            // ),
                            // Center(
                            //   child: Text(
                            //     AppLocalizations.of(context)!.translate('requestVehicleService')!,
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold, fontSize: 15),
                            //   ),
                            // ),
                            Text(
                              '- Request for service',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              '- Get truck load requests',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              '- Manage all your vehicles at one place',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              '- Find service provider nearby',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
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
                                '₹ 1499/- for 12 months',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 20),
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            // Center(
                            //   child: Text(
                            //     AppLocalizations.of(context)!.translate('lifeTimeRegister')!,
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold, fontSize: 15),
                            //   ),
                            // ),
                            // const SizedBox(
                            //   height: 2,
                            // ),
                            // Center(
                            //   child: Text(
                            //     AppLocalizations.of(context)!.translate('requestVehicleService')!,
                            //     style: TextStyle(
                            //         fontWeight: FontWeight.bold, fontSize: 15),
                            //   ),
                            // ),
                            Text(
                              '- Request for service',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              '- Get truck load requests',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              '- Manage all your vehicles at one place',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Text(
                              '- Find service provider nearby',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              );
  }
}
