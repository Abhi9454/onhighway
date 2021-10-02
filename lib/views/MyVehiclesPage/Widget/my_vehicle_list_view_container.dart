import 'package:flutter/material.dart';

import '../../../config.dart';

class MyVehicleListViewContainer extends StatelessWidget {
  const MyVehicleListViewContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Car | Diesel'),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Marti Alto K10 DL1RTA4470',
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  'Renewal Date : 31/10/2021',
                  maxLines: 2,
                  textAlign: TextAlign.left,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: Row(
                        children: [
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Delete',
                              style: TextStyle(fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(primary: Colors.red),
                          ),
                          const SizedBox(
                            width: 3,
                          ),
                          ElevatedButton(
                            onPressed: () {},
                            child: Text(
                              'Hold',
                              style: TextStyle(fontSize: 15),
                            ),
                            style: ElevatedButton.styleFrom(
                                primary: AppConfig().secondary),
                          )
                        ],
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Need Service',
                        style: TextStyle(fontSize: 15),
                      ),
                      style: ElevatedButton.styleFrom(primary: AppConfig().primary),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
