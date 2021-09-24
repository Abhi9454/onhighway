import 'package:flutter/material.dart';
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
            width: MediaQuery.of(context).size.width * 0.9,
            color: AppConfig().secondary,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Request a new service',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
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
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: AppConfig().onPrimary,
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height / 7,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Add a new vehicle',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                color: AppConfig().onPrimary,
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height / 7,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
                        child: Icon(
                          Icons.car_repair,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'View vehicles added',
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  print('Service History Box');
                },
                child: Container(
                  color: AppConfig().onPrimary,
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height / 7,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
                          child: Icon(
                            Icons.history,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              bottom: 10.0, right: 5.0, left: 5.0),
                          child: Text(
                            'Service History',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
