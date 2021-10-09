import 'package:flutter/material.dart';
import '../../../config.dart';

class MyVehicleListViewContainer extends StatelessWidget {
  MyVehicleListViewContainer(
      {required this.vehicleId,required this.vehicleType, required this.vehicleFuelType, required this.vehicleListName,required this.vehicleModel});

  final String vehicleId;
  final String vehicleType;
  final String vehicleFuelType;
  final String vehicleListName;
  final String vehicleModel;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        print(vehicleId.toString());
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('$vehicleType | $vehicleFuelType',style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15)),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '$vehicleModel',
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    '$vehicleListName',
                    maxLines: 2,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontWeight: FontWeight.normal, fontSize: 15),
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
      ),
    );
  }
}
