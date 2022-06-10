import 'package:flutter/material.dart';
import '../../views/MyVehicleLoad/widget/my_vehicle_load_list_container.dart';
import '../../viewModels/my_vehicle_load_view_model.dart';

class MyVehicleLoadBodyPageWidget extends StatelessWidget {
  MyVehicleLoadBodyPageWidget(
      {required this.context, required this.myVehicleLoadModel});

  final BuildContext context;
  final MyVehicleLoadViewModel myVehicleLoadModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: myVehicleLoadModel.myVehicleLoadDetails.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return MyVehicleLoadListViewContainer(
            viewModel : myVehicleLoadModel,
            model:  myVehicleLoadModel.myVehicleLoadDetails[index],
          );
        });
  }
}
