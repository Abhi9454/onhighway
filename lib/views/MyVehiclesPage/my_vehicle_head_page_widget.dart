import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import './../../helpers/enum.dart';
import './././../../viewModels/my_vehicles_view_model.dart';
import 'package:provider/provider.dart';
import '../MyVehiclesPage/my_vehicle_body_page_widget.dart';

import '../../config.dart';

class MyVehicleHeadPageWidget extends StatelessWidget {
  const MyVehicleHeadPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<MyVehiclesListViewModel>(context,listen: false).fetchList();
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
      body: Consumer<MyVehiclesListViewModel>(
        builder: (con, myVehicleModel, _) {
          return SafeArea(
            child: myVehicleModel.status == Status.loading
                ? SizedBox(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : myVehicleModel.status == Status.error
                    ? SizedBox(
                        child: Center(
                          child: Text(
                            myVehicleModel.error.message,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                      )
                    : myVehicleModel.status == Status.success &&
                            myVehicleModel.vehicleDetails.isEmpty
                        ? const SizedBox(
                            child: Center(
                              child: Text(
                                'Not Vehicles Added.',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 18),
                              ),
                            ),
                          )
                        : myVehicleModel.status == Status.success
                            ? SingleChildScrollView(
                                scrollDirection: Axis.vertical,
                                child: MyVehicleBodyPageWidget(
                                    addVehicleContext: con,
                                    myVehicleModel: myVehicleModel),
                                //Stateless Body Widget
                              )
                            : SizedBox(),
          );
        },
      ),
    );
  }
}
