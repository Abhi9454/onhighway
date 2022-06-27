import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onhighway/viewModels/my_vehicle_load_view_model.dart';
import 'package:onhighway/views/MyVehicleLoad/my_vehicle_load_body_widget.dart';
import '../../locale/app_localization.dart';
import '../../viewModels/vehicle_load_view_model.dart';
import '../../views/VehicleLoadPage/vehicle_load_body_page_widget.dart';
import '../../helpers/enum.dart';
import 'package:provider/provider.dart';

import '../../config.dart';

class MyVehicleLoadHeadPageWidget extends StatelessWidget {
  const MyVehicleLoadHeadPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<MyVehicleLoadViewModel>(context, listen: false).fetchList();
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
              AppLocalizations.of(context)!.translate('acceptedLoad')!,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
      body: Consumer<MyVehicleLoadViewModel>(
        builder: (con, myVehicleLoadDetails, _) {
          return myVehicleLoadDetails.status == Status.loading
              ? SizedBox(
            child: Center(child: CircularProgressIndicator()),
          )
              : myVehicleLoadDetails.status == Status.error
              ? SizedBox(
            child: Center(
              child: Text(
                myVehicleLoadDetails.error.message,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          )
              : myVehicleLoadDetails.status == Status.success &&
              myVehicleLoadDetails.myVehicleLoadDetails.isEmpty
              ? const SizedBox(
            child: Center(
              child: Text(
                'No Accepted Load.',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          )
              : myVehicleLoadDetails.status == Status.success
              ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: MyVehicleLoadBodyPageWidget(
                context: con, myVehicleLoadModel: myVehicleLoadDetails,

              ))
              : SizedBox();
        },
      ),
    );
  }
}
