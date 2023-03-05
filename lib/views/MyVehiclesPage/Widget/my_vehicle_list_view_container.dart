import 'package:flutter/material.dart';
import 'package:onhighway/viewModels/my_vehicles_view_model.dart';
import '../../../models/user_vehicle.dart';
import '../../../config.dart';

class MyVehicleListViewContainer extends StatefulWidget {
  MyVehicleListViewContainer(
      {required this.myVehicleModel, required this.myVehicleViewModel});

  final UserVehicleModel myVehicleModel;
  final MyVehiclesListViewModel myVehicleViewModel;

  @override
  State<MyVehicleListViewContainer> createState() => _MyVehicleListViewContainerState();
}

class _MyVehicleListViewContainerState extends State<MyVehicleListViewContainer> {


  String planValue = 'Choose Plan';
  int selectedPlan = 0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(widget.myVehicleModel.vehicleId);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      widget.myVehicleModel.vehicleType +
                          ' | ' +
                          widget.myVehicleModel.vehicleFuelType +
                          ' | ' +
                          widget.myVehicleModel.paymentType,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.myVehicleModel.vehicleModel,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        widget.myVehicleModel.vehicleStatus,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: widget.myVehicleModel.vehicleStatus == 'Active'
                                ? Colors.green
                                : Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    widget.myVehicleModel.vehicleListName,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Renewal Date : ' + widget.myVehicleModel.vehicleRenewalDate,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: planValue,
                          items: <String>[
                            'Choose Plan',
                            '₹ 499',
                            '₹ 999',
                            '₹ 1499'
                          ].map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (val) {
                            if(val != 'Choose Plan'){
                              setState(() {
                                planValue = val!;
                                if(planValue == '₹ 499'){
                                  selectedPlan = 499;
                                }
                                else if(planValue == '₹ 999'){
                                  selectedPlan = 999;
                                }
                                else{
                                  selectedPlan = 1499;
                                }
                              });
                            }
                          },
                        ),
                      ),
                      ElevatedButton(
                        onPressed: planValue != 'Choose Plan' ? () async {
                          await widget.myVehicleViewModel.initPayment(
                              widget.myVehicleModel.vehicleId,
                              widget.myVehicleModel.paymentType);
                          if (widget.myVehicleViewModel
                              .paymentTransactionId.isNotEmpty) {
                            widget.myVehicleViewModel
                                .openCheckout(selectedPlan);
                          }
                        } : null,
                        child: Text(
                          'Pay Now',
                          style: TextStyle(fontSize: 15),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppConfig().primary,
                          disabledBackgroundColor: Colors.grey
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
