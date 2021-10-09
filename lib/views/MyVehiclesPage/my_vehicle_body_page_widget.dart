import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../viewModels/my_vehicles_view_model.dart';
import '../MyVehiclesPage/Widget/my_vehicle_list_view_container.dart';

class MyVehicleBodyPageWidget extends StatelessWidget {
  MyVehicleBodyPageWidget(
      {required this.addVehicleContext, required this.myVehicleModel});

  final BuildContext addVehicleContext;
  final MyVehiclesListViewModel myVehicleModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myVehicleModel.vehicleDetails.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return MyVehicleListViewContainer(
            vehicleId: myVehicleModel.vehicleDetails[index].vehicleId,
            vehicleType: myVehicleModel.vehicleDetails[index].vehicleType,
            vehicleFuelType:
                myVehicleModel.vehicleDetails[index].vehicleFuelType,
            vehicleListName:
                myVehicleModel.vehicleDetails[index].vehicleListName,
            vehicleModel: myVehicleModel.vehicleDetails[index].vehicleModel,
          );
        });
  }
}
