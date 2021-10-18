import 'package:flutter/material.dart';
import './.././../helpers/enum.dart';
import '.././../viewModels/add_vehicle_view_model.dart';
import '../Widgets/app_footer.dart';
import '../Widgets/poster_widget.dart';
import '../../config.dart';
import '../Widgets/app_head_logo_widget.dart';

class AddNewVehicleBodyWidget extends StatelessWidget {
  AddNewVehicleBodyWidget(
      {required this.addVehicleContext, required this.vehicleModel});

  final BuildContext addVehicleContext;
  final AddVehicleViewModel vehicleModel;
  final TextEditingController vehicleNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const AppHeadLogoWidget(),
        vehicleModel.status == Status.trueResponse
            ? Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  'Vehicle Added Successfully',
                  style: TextStyle(color: AppConfig().primary, fontSize: 18, fontWeight: FontWeight.bold),
                ),
            )
            : SizedBox(),
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
                          value: vehicleModel.vehicleType,
                          //elevation: 5,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.black,
                          items: [
                            'Select Vehicle Type',
                            'Truck',
                            'Car',
                            'Bus'
                          ].map<DropdownMenuItem<String>>((String typeValue) {
                            return DropdownMenuItem<String>(
                              value: typeValue,
                              child: Text(
                                typeValue,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue! != 'Select Vehicle Type') {
                              vehicleModel.setVehicleType(newValue);
                              vehicleModel.fetchVehicleBrands();
                            }
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
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          focusColor: Colors.white,
                          value: vehicleModel.selectedVehicleBrandName,
                          //elevation: 5,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.black,
                          items: vehicleModel.vehicleBrandsOnType
                              .map<DropdownMenuItem<String>>(
                                  (String typeValue) {
                            return DropdownMenuItem<String>(
                              value: typeValue,
                              child: Text(
                                typeValue,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue! != 'Select Vehicle Brands') {
                              vehicleModel.setVehicleBrand(newValue);
                              vehicleModel.fetchVehicleModel();
                            }
                          },
                          hint: Text(
                            'Select Vehicle Brands',
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
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          focusColor: Colors.white,
                          value: vehicleModel.selectedVehicleModelName,
                          //elevation: 5,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.black,
                          items: vehicleModel.vehicleModelOnType
                              .map<DropdownMenuItem<String>>(
                                  (String typeValue) {
                            return DropdownMenuItem<String>(
                              value: typeValue,
                              child: Text(
                                typeValue,
                                style: TextStyle(color: Colors.black),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue! != 'Select Vehicle Models') {
                              vehicleModel.setVehicleModel(newValue);
                            }
                          },
                          hint: Text(
                            'Select Vehicle Models',
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
                        padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                        child: DropdownButton<String>(
                          isExpanded: true,
                          focusColor: Colors.white,
                          value: vehicleModel.vehicleFuelType,
                          //elevation: 5,
                          style: TextStyle(color: Colors.white),
                          iconEnabledColor: Colors.black,
                          items: ['Select Fuel Type', 'Petrol', 'Diesel', 'CNG']
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
                            vehicleModel.setVehicleFuelType(newValue!);
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
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15.0, right: 15),
                        child: TextFormField(
                          autofocus: false,
                          controller: vehicleNumberController,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                          decoration: const InputDecoration(
                            hintText: 'Vehicle Number i.e. DL12MK1234 or dl12mk1234',
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          if (vehicleModel.selectedVehicleModelName != 'Select Model Name' &&
                              vehicleModel.selectedVehicleBrandName !=
                                  'Select Brand Name' &&
                              vehicleModel.vehicleFuelType !=
                                  'Select Fuel Type' &&
                              vehicleModel.vehicleType !=
                                  'Select Vehicle Type' &&
                              vehicleNumberController.text.isNotEmpty) {
                            if (vehicleNumberController.text.length < 8 ||
                                vehicleNumberController.text.length > 12) {
                              final snackBar = SnackBar(
                                content: const Text(
                                  'Enter valid vehicle Number',
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white),
                                ),
                                backgroundColor: (AppConfig().primary),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                            } else {
                              vehicleModel
                                  .addVehicle(vehicleNumberController.text);
                            }
                          } else {
                            final snackBar = SnackBar(
                              content: const Text(
                                'Invalid Details',
                                style: TextStyle(
                                    fontSize: 15, color: Colors.white),
                              ),
                              backgroundColor: (AppConfig().primary),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          }
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
