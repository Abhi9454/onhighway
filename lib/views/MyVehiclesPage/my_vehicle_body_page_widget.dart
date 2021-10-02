import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../MyVehiclesPage/Widget/my_vehicle_list_view_container.dart';
import '../../config.dart';

class MyVehicleBodyPageWidget extends StatelessWidget {
  const MyVehicleBodyPageWidget({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return MyVehicleListViewContainer();
        });
  }
}
