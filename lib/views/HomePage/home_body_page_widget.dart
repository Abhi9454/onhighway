import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onhighway/views/AddNewVehiclePage/add_new_vehicle_page_head_widget.dart';
import 'package:onhighway/views/MyVehiclesPage/my_vehicle_head_page_widget.dart';
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
        AppHeadLogoWidget(),
        AppBodyPaymentContainer(),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                color: AppConfig().secondary,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'requestService',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black, fontSize: 24),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                AddNewVehicleHeadPageWidget()));
                  },
                  child: AppBodyNavigationContainer('addVehicle', Icons.add),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MyVehicleHeadPageWidget()));
                  },
                  child: AppBodyNavigationContainer(
                      'myVehicles', Icons.car_rental),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {},
                  child: AppBodyNavigationContainer(
                      'runningService', Icons.run_circle),
                )
              ],
            ),
          ),
        ),
        PosterWidget(),
        AppFooter()
      ],
    );
  }
}
