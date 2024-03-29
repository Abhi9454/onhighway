import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../config.dart';

class ServiceHistoryListViewContainerWidget extends StatelessWidget {
  ServiceHistoryListViewContainerWidget(
      {required this.serviceDate,
      required this.serviceAmount,
      required this.vehicleListName,
      required this.serviceText,
      required this.serviceStatus,
      required this.serviceReqId,
        required this.serviceInvoiceUrl
      });

  final String serviceDate;
  final String serviceAmount;
  final String vehicleListName;
  final String serviceText;
  final String serviceStatus;
  final String serviceReqId;
  final String serviceInvoiceUrl;

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

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
              Text('Service Date : $serviceDate'),
              const SizedBox(
                height: 5,
              ),
              Text('Amount : Rs. $serviceAmount'),
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
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _launchInBrowser(serviceInvoiceUrl);
                    },
                    child: Text(
                      'Invoice',
                      style: TextStyle(fontSize: 13),
                    ),
                    style:
                        ElevatedButton.styleFrom(primary: AppConfig().primary),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
