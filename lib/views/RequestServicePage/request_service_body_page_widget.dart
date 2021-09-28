import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AddNewVehiclePage/add_new_vehicle_page_head_widget.dart';
import '../Widgets/poster_widget.dart';
import '../Widgets/app_body_options_navigation_widget.dart';
import '../Widgets/app_footer.dart';
import '../../config.dart';
import '../Widgets/app_body_payment_container_widget.dart';
import '../Widgets/app_head_logo_widget.dart';

class RequestServiceBodyPageWidget extends StatelessWidget {
  const RequestServiceBodyPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _chosenVehicle = 'Truck';

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppHeadLogoWidget(),
        AppBodyPaymentContainer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            color: AppConfig().secondary,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Choose options',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.80,
          height: MediaQuery.of(context).size.height / 4,
          color: AppConfig().onSecondary,
          child: Column(
            children: [
              DropdownButton<String>(
                focusColor: Colors.white,
                value: _chosenVehicle,
                //elevation: 5,
                style: TextStyle(color: Colors.white),
                iconEnabledColor: Colors.black,
                items: <String>['Truck', 'Car', 'Bulldozer']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black),
                    ),
                  );
                }).toList(),
                hint: Text(
                  "Select Vehicle",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(AddNewVehicleHeadPageWidget());
                },
                child:
                    AppBodyNavigationContainer('Add a new vehicle', Icons.add),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  print('Service History Box');
                },
                child: AppBodyNavigationContainer(
                    'View vehicles added', Icons.car_rental),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  print('Service History Box');
                },
                child: AppBodyNavigationContainer(
                    'Service History', Icons.history),
              )
            ],
          ),
        ),
        PosterWidget(),
        AppFooter() //Footer
      ],
    );
  }
}
