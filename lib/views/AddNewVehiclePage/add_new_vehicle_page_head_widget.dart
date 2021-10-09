import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onhighway/helpers/enum.dart';
import 'package:onhighway/viewModels/add_vehicle_view_model.dart';
import 'package:provider/provider.dart';
import '../AddNewVehiclePage/add_new_vehicle_page_body_widget.dart';
import '../../config.dart';

class AddNewVehicleHeadPageWidget extends StatelessWidget {
  const AddNewVehicleHeadPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddVehicleViewModel>(
      create: (context) => AddVehicleViewModel(),
      child: Consumer<AddVehicleViewModel>(
        builder: (con, addVehicleModel, _) {
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
              child: addVehicleModel.status == Status.loading
                  ? SizedBox(
                      child: Center(child: CircularProgressIndicator()),
                    )
                  : addVehicleModel.status == Status.error
                      ? SizedBox(
                          child: Center(
                            child: Text(
                              addVehicleModel.error.message,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                          ),
                        )
                      : SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: AddNewVehicleBodyWidget(
                            addVehicleContext: con,
                            vehicleModel: addVehicleModel,
                          ),
                          //Stateless Body Widget
                        ),
            ),
          );
        },
      ),
    );
  }
}
