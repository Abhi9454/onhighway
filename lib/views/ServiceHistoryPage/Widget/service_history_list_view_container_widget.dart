import 'package:flutter/material.dart';

import '../../../config.dart';
class ServiceHistoryListViewContainerWidget extends StatelessWidget {
  const ServiceHistoryListViewContainerWidget({Key? key}) : super(key: key);

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
                children: [Text('Date : 21/2/2021'), Text('Amount : Rs. 2000')],
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Marti Alto K10 DL1RTA4470',
                maxLines: 2,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                'Service : Diesel refill from location near Delhi',
                maxLines: 3,
                textAlign: TextAlign.left,
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 13),
              ),
              const SizedBox(
                height: 2,
              ),
              Text(
                'Remarks : Paid to my peers. Test case',
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
                    onPressed: () {},
                    child: Text('Invoice',style: TextStyle(fontSize: 13),),
                    style: ElevatedButton.styleFrom(primary: AppConfig().primary),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text('View Vendor',style: TextStyle(fontSize: 13),),
                    style: ElevatedButton.styleFrom(
                        primary: AppConfig().secondary),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
