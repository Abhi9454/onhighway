import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../AddNewVehiclePage/add_new_vehicle_page_body_widget.dart';
import '../../config.dart';


class AddNewVehicleHeadPageWidget extends StatelessWidget {
  const AddNewVehicleHeadPageWidget({Key? key}) : super(key: key);

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
            'Add New Vehicle',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: AddNewVehicleBodyWidget(),
          //Stateless Body Widget
        ),
      ),
    );
  }
}
