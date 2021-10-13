import 'package:flutter/material.dart';
import '/views/RunningServicePage/Widgets/runningServiceListViewContainer.dart';
import '../../viewModels/running_service_view_model.dart';

class RunningServiceBodyPageWidget extends StatelessWidget {
  RunningServiceBodyPageWidget({required this.context,required this.runningServiceModel});

  final BuildContext context;
  final RunningServiceViewModel runningServiceModel;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: runningServiceModel.serviceDetails.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return RunningServiceListViewContainer(
            serviceDate: runningServiceModel.serviceDetails[index].serviceDate,
            serviceReqId:
            runningServiceModel.serviceDetails[index].serviceReqId,
            serviceStatus:
            runningServiceModel.serviceDetails[index].serviceStatus,
            serviceText: runningServiceModel.serviceDetails[index].serviceText,
            vehicleListName:
            runningServiceModel.serviceDetails[index].vehicleListName,
            model : runningServiceModel
          );
        });
  }
}
