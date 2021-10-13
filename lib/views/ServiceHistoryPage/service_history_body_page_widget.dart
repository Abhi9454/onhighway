import 'package:flutter/material.dart';
import '../../viewModels/service_history_view_model.dart';
import '../ServiceHistoryPage/Widget/service_history_list_view_container_widget.dart';

class ServiceHistoryBodyPageWidget extends StatelessWidget {
  ServiceHistoryBodyPageWidget(
      {required this.serviceHistoryContext, required this.serviceHistoryModel});

  final BuildContext serviceHistoryContext;
  final ServiceHistoryViewModel serviceHistoryModel;



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: serviceHistoryModel.serviceDetails.length,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return ServiceHistoryListViewContainerWidget(
            serviceDate: serviceHistoryModel.serviceDetails[index].serviceDate,
            serviceAmount:
                serviceHistoryModel.serviceDetails[index].serviceAmount,
            serviceReqId:
                serviceHistoryModel.serviceDetails[index].serviceReqId,
            serviceStatus:
                serviceHistoryModel.serviceDetails[index].serviceStatus,
            serviceText: serviceHistoryModel.serviceDetails[index].serviceText,
            vehicleListName:
                serviceHistoryModel.serviceDetails[index].vehicleListName,
            serviceInvoiceUrl: serviceHistoryModel.serviceDetails[index].serviceInvoice,
          );
        });
  }
}
