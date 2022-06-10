import 'package:flutter/material.dart';
import '../../../models/vehicle_load.dart';
import '../../../viewModels/my_vehicle_load_view_model.dart';

class MyVehicleLoadListViewContainer extends StatelessWidget {
  MyVehicleLoadListViewContainer(
      {required this.viewModel, required this.model});

  final MyVehicleLoadViewModel viewModel;
  final VehicleLoad model;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Requested Date : '+model.date),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                model.detail,
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Request Id : '+model.requestId,
                maxLines: 3,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Weight : '+model.weight + 'kg',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Dimensions : '+model.dimension ,
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Pick Up Address : '+model.pickUpAddress + ','+ model.pickUpCity + ',' + model.pickUpState + ',' + model.pickUpPinCode,
                maxLines: 3,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Drop Address : '+model.dropAddress + ','+ model.dropCity + ',' + model.dropState + ',' + model.dropPinCode,
                maxLines: 3,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Status : '+model.status ,
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
