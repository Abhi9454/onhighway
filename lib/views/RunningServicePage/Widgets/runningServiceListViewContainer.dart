import 'package:flutter/material.dart';
import '../../../viewModels/running_service_view_model.dart';

import '../../../config.dart';

class RunningServiceListViewContainer extends StatelessWidget {
  RunningServiceListViewContainer(
      {required this.serviceDate,
      required this.vehicleListName,
      required this.serviceText,
      required this.serviceStatus,
      required this.serviceReqId,
      required this.model});

  final String serviceDate;
  final String vehicleListName;
  final String serviceText;
  final String serviceStatus;
  final String serviceReqId;
  final RunningServiceViewModel model;

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
                  Text('Service Date : $serviceDate'),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                '$vehicleListName',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Service : $serviceText',
                maxLines: 3,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Status : $serviceStatus',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
              ),
              const SizedBox(
                height: 5,
              ),
              ElevatedButton(
                onPressed: () {
                  print(serviceReqId.toString());
                  model.deleteRequest(serviceReqId);
                },
                child: Text(
                  'Delete Request',
                  style: TextStyle(fontSize: 13),
                ),
                style: ElevatedButton.styleFrom(primary: AppConfig().secondary),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
