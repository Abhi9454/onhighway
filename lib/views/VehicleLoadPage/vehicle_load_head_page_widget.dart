import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onhighway/viewModels/my_vehicle_load_view_model.dart';
import 'package:onhighway/views/MyVehicleLoad/my_vehicle_load_head_page_widget.dart';
import '../../locale/app_localization.dart';
import '../../viewModels/vehicle_load_view_model.dart';
import '../../views/VehicleLoadPage/vehicle_load_body_page_widget.dart';
import '../../helpers/enum.dart';
import 'package:provider/provider.dart';

import '../../config.dart';

class VehicleLoadHeadPageWidget extends StatelessWidget {
  const VehicleLoadHeadPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<VehicleLoadViewModel>(context, listen: false).fetchList();
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
            AppLocalizations.of(context)!.translate('viewLoad')!,
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
          actions: [
            IconButton(onPressed: (){
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MultiProvider(providers: <
                          ChangeNotifierProvider<
                              MyVehicleLoadViewModel>>[
                        ChangeNotifierProvider<MyVehicleLoadViewModel>(
                            create: (_) => MyVehicleLoadViewModel())
                      ], child: MyVehicleLoadHeadPageWidget())));
            }, icon: Icon(CupertinoIcons.car_fill,color: Colors.black,))
          ],
        ),
      ),
      body: Consumer<VehicleLoadViewModel>(
        builder: (con, vehicleLoadModel, _) {
          return vehicleLoadModel.status == Status.loading
              ? SizedBox(
            child: Center(child: CircularProgressIndicator()),
          )
              : vehicleLoadModel.status == Status.error
              ? SizedBox(
            child: Center(
              child: Text(
                vehicleLoadModel.error.message,
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          )
              : vehicleLoadModel.status == Status.success &&
              vehicleLoadModel.vehicleLoadDetails.isEmpty
              ? const SizedBox(
            child: Center(
              child: Text(
                'No Load Request Found.',
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 20),
              ),
            ),
          )
              :  vehicleLoadModel.status == Status.success
              ? SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: VehicleLoadBodyPageWidget(
                context: con,
                vehicleLoadModel: vehicleLoadModel,
              ))
              : SizedBox();
        },
      ),
    );
  }
}
