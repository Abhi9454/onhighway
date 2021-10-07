import 'package:flutter/material.dart';
import '../Widgets/app_footer.dart';
import '../Widgets/poster_widget.dart';
import '../../config.dart';
import '../Widgets/app_head_logo_widget.dart';

class AddNewVehicleBodyWidget extends StatelessWidget {
  const AddNewVehicleBodyWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    String vehicleType = "Select Vehicle Type";
    String vehicleFuelType = 'Select Fuel Type';


    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const AppHeadLogoWidget(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.9,
            color: AppConfig().secondary,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Enter Details',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.90,
          color: AppConfig().onSecondary,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          focusColor: Colors.white,
                          value: vehicleType,
                          //elevation: 5,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.black,
                          items: ['Select Vehicle Type','Truck', 'Car', 'Bus']
                              .map<DropdownMenuItem<String>>((String typeValue) {
                            return DropdownMenuItem<String>(
                              value: typeValue,
                              child: Text(
                                typeValue,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            print(newValue);
                            vehicleType = newValue!;
                          },
                          hint: Text(
                            "Select Vehicle Type",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, top: 5.0, bottom: 5.0),
                        child: TextFormField(
                          autofocus: false,
                          style:
                          TextStyle(color: Colors.black, fontSize: 18),
                          decoration: const InputDecoration(
                            hintText: 'Vehicle Brand',
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                              )
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, top: 5.0, bottom: 5.0),
                        child: TextFormField(
                          autofocus: false,
                          style:
                          TextStyle(color: Colors.black, fontSize: 18),
                          decoration: const InputDecoration(
                            hintText: 'Vehicle Model',
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, top: 5.0, bottom: 5.0),
                        child: TextFormField(
                          autofocus: false,
                          style:
                          TextStyle(color: Colors.black, fontSize: 18),
                          decoration: const InputDecoration(
                            hintText: 'Vehicle Number',
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                              )
                          ),
                        ),
                      ),
                      const SizedBox(height: 15,),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          focusColor: Colors.white,
                          value: vehicleFuelType,
                          //elevation: 5,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.black,
                          items:['Select Fuel Type','Petrol', 'Diesel', 'CNG']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(
                                value,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            print(newValue);
                            vehicleType = newValue!;
                          },
                          hint: Text(
                            "Select Fuel Type",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                        },
                        child: Text('Submit'),
                        style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          primary: Color(0XFF091e6d),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const PosterWidget(),
        AppFooter() //Footer
      ],
    );
  }
}
