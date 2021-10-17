import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../viewModels/request_service_view_model.dart';
import '../Widgets/poster_widget.dart';
import '../Widgets/app_footer.dart';
import 'package:google_maps_place_picker/google_maps_place_picker.dart';
import '../../config.dart';
import '../../helpers/enum.dart';

class RequestServiceBodyPageWidget extends StatelessWidget {
  RequestServiceBodyPageWidget({required this.requestServiceModel});

  final RequestServiceViewModel requestServiceModel;
  final TextEditingController serviceTextController = TextEditingController();
  final TextEditingController locationTextController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  static final kInitialPosition = LatLng(-33.8567844, 151.213108);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        requestServiceModel.status == Status.trueResponse
            ? Center(
                child: Text(
                  'Request Added Successfully',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              )
            : SizedBox(),
        requestServiceModel.status == Status.errorResponse
            ? Center(
                child: Text(
                  'Something went wrong',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                'Choose options',
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
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: DropdownButton<String>(
                  focusColor: Colors.white,
                  isExpanded: true,
                  value: requestServiceModel.selectedVehicleName,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: requestServiceModel.vehicleListName
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    if (value != 'Select Vehicle') {
                      requestServiceModel.setVehicleId(value!);
                    }
                  },
                  hint: Text(
                    "Select Your Vehicle",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 20),
                child: DropdownButton<String>(
                  focusColor: Colors.white,
                  isExpanded: true,
                  value: requestServiceModel.selectedServiceType,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: requestServiceModel.serviceTypeSelectList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black),
                      ),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    if (value != 'Select Service Type') {
                      requestServiceModel.setServiceRequestId(value!);
                    }
                  },
                  hint: Text(
                    "Select Service",
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
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 15.0, right: 15, top: 5.0, bottom: 5.0),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.6,
                      child: TextFormField(
                        autofocus: false,
                        controller: locationTextController,
                        style: TextStyle(color: Colors.black, fontSize: 13),
                        decoration: const InputDecoration(
                            hintText: 'Enter Location/Address',
                            enabledBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide: const BorderSide(
                                  color: Colors.grey, width: 0.0),
                            )),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    child: ElevatedButton(
                      onPressed: () async {
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             GoogleMapPageWidget()));
                        var location = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlacePicker(
                              apiKey:
                                  'AIzaSyDf-uGBawxBF5Kd4AlbilXKrLRCwdHAGT8', // Put YOUR OWN KEY here.
                              onPlacePicked: (result) {
                                print(result);
                                Navigator.of(context).pop();
                              },
                              initialPosition: kInitialPosition,
                              useCurrentLocation: true,
                            ),
                          ),
                        );
                        print("Location Picked is : "+location.toString());
                      },
                      child: Text('Select'),
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                          ),
                          primary: Color(0XFF091e6d),
                          padding: const EdgeInsets.all(15.0)),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15, top: 5.0, bottom: 5.0),
                child: TextFormField(
                  autofocus: false,
                  controller: addressController,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  decoration: const InputDecoration(
                      hintText: 'Enter Address',
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      )),
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
                  maxLines: 5,
                  controller: serviceTextController,
                  style: TextStyle(color: Colors.black, fontSize: 13),
                  decoration: const InputDecoration(
                      hintText: 'Enter Problem',
                      enabledBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      ),
                      focusedBorder: const OutlineInputBorder(
                        borderSide:
                            const BorderSide(color: Colors.grey, width: 0.0),
                      )),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  if (requestServiceModel.selectedServiceType !=
                          'Select Service Type' &&
                      requestServiceModel.selectedVehicleName !=
                          'Select Vehicle' &&
                      serviceTextController.text.isNotEmpty &&
                      addressController.text.isNotEmpty) {
                    requestServiceModel.serviceRequest(
                        addressController.text, serviceTextController.text);
                  } else {
                    final snackBar = SnackBar(
                      content: const Text(
                        'Invalid Details',
                        style: TextStyle(fontSize: 15, color: Colors.white),
                      ),
                      backgroundColor: (AppConfig().primary),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
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
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
        ),
        PosterWidget(),
        AppFooter() //Footer
      ],
    );
  }
}
