import 'package:flutter/material.dart';
import '../Widgets/poster_widget.dart';
import '../Widgets/app_footer.dart';
import '../../config.dart';

class RequestServiceBodyPageWidget extends StatelessWidget {
  const RequestServiceBodyPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String _chosenVehicle = 'Select your Vehicle';
    String _serviceType = 'Select Service';

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
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
                  value: _chosenVehicle,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: <String>['Select your Vehicle','Truck', 'Car', 'Bulldozer']
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
                    print(value!);
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
                padding: const EdgeInsets.only(left: 15.0,right: 20),
                child: DropdownButton<String>(
                  focusColor: Colors.white,
                  isExpanded: true,
                  value: _serviceType,
                  //elevation: 5,
                  style: TextStyle(color: Colors.white),
                  iconEnabledColor: Colors.black,
                  items: <String>['Select Service','Shockup', 'Diesel', 'Petrol', 'Car Towing','Tire Puncture','Accident Assistance','Police Assistance','Medical Assistance','Hotel & Stay Assistance']
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
                    print(value!);
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
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15, top: 5.0, bottom: 5.0),
                child: TextFormField(
                  autofocus: false,
                  style:
                  TextStyle(color: Colors.black, fontSize: 13),
                  decoration: const InputDecoration(
                      hintText: 'Enter Live Location/Address',
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
                  TextStyle(color: Colors.black, fontSize: 13),
                  decoration: const InputDecoration(
                      hintText: 'Enter Pincode',
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
                  maxLines: 5,
                  style:
                  TextStyle(color: Colors.black, fontSize: 13),
                  decoration: const InputDecoration(
                      hintText: 'Enter Problem',
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
