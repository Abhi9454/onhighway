import 'package:flutter/material.dart';
import 'package:onhighway/viewModels/my_vehicles_view_model.dart';
import '../../../models/user_vehicle.dart';
import '../../../config.dart';

class MyVehicleListViewContainer extends StatelessWidget {
  MyVehicleListViewContainer(
      {required this.myVehicleModel, required this.myVehicleViewModel});

  final UserVehicleModel myVehicleModel;
  final MyVehiclesListViewModel myVehicleViewModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(myVehicleModel.vehicleId);
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
                  Text(myVehicleModel.vehicleType + ' | ' + myVehicleModel.vehicleFuelType + ' | ' + myVehicleModel.paymentType,
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16)),
                  const SizedBox(
                    height: 2,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        myVehicleModel.vehicleModel,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      Text(
                        myVehicleModel.vehicleStatus,
                        maxLines: 2,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color : myVehicleModel.vehicleStatus == 'Active' ? Colors.green : Colors.red),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    myVehicleModel.vehicleListName,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    'Renewal Date : '+myVehicleModel.vehicleRenewalDate,
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style:
                        TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  ElevatedButton(
                    onPressed: () async{
                      await myVehicleViewModel.initPayment(myVehicleModel.vehicleId, myVehicleModel.paymentType);
                      if(myVehicleViewModel.paymentTransactionId.isNotEmpty){
                        myVehicleViewModel.openCheckout(myVehicleModel.paymentAmount);
                      }
                    },
                    child: Text(
                      'Pay Rs.' + myVehicleModel.paymentAmount.toString(),
                      style: TextStyle(fontSize: 15),
                    ),
                    style:
                        ElevatedButton.styleFrom(primary: AppConfig().primary),
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
