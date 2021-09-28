import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../AddNewVehiclePage/add_new_vehicle_page_head_widget.dart';
import '/views/RequestServicePage/request_service_head_page_widget.dart';
import '/views/Widgets/app_body_options_navigation_widget.dart';
import '/views/Widgets/app_footer.dart';
import '../Widgets/app_body_payment_container_widget.dart';
import '../Widgets/app_head_logo_widget.dart';
import '../Widgets/poster_widget.dart';
import '../../config.dart';

class HomePageBodyWidget extends StatelessWidget {
  const HomePageBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppHeadLogoWidget(),                       /// Header Logo
        AppBodyPaymentContainer(),                 ///Header payment button widget
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Get.to(RequestServiceHeadPageWidget());             ///Navigate to Request service page
                },
                child: Container(
                  color: AppConfig().secondary,
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Request a new service',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(RequestServiceHeadPageWidget());           ///Navigate to Running services Page
                },
                child: Container(
                  color: AppConfig().secondary,
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height / 6,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        'Running services',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
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
        PosterWidget(), ///Bottom App Poster
        AppFooter() ///App Footer
      ],
    );
  }
}
