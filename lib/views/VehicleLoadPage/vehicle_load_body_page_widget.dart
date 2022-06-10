import 'package:flutter/material.dart';
import '../../viewModels/vehicle_load_view_model.dart';
import '../../views/VehicleLoadPage/widget/vehicle_load_list_container.dart';

class VehicleLoadBodyPageWidget extends StatelessWidget {
  VehicleLoadBodyPageWidget(
      {required this.context, required this.vehicleLoadModel});

  final BuildContext context;
  final VehicleLoadViewModel vehicleLoadModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: vehicleLoadModel.vehicleLoadDetails.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return VehicleListViewContainer(
            viewModel: vehicleLoadModel,
            model: vehicleLoadModel.vehicleLoadDetails[index],
          );
        });
  }
}
