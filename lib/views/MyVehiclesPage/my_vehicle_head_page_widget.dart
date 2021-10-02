import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../MyVehiclesPage/my_vehicle_body_page_widget.dart';

import '../../config.dart';

class MyVehicleHeadPageWidget extends StatelessWidget {
  const MyVehicleHeadPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: AppConfig().secondary,
          leading: IconButton(
            icon: Icon(CupertinoIcons.back, color: AppConfig().primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'My Vehicle',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: MyVehicleBodyPageWidget(),
          //Stateless Body Widget
        ),
      ),
    );
  }
}
