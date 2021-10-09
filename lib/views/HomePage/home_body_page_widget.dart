import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../locale/app_localization.dart';
import '../../viewModels/home_page_view_model.dart';
import '../../viewModels/my_vehicles_view_model.dart';
import '../../views/AddNewVehiclePage/add_new_vehicle_page_head_widget.dart';
import '../../views/MyVehiclesPage/my_vehicle_head_page_widget.dart';
import 'package:provider/provider.dart';
import '/views/Widgets/app_body_options_navigation_widget.dart';
import '/views/Widgets/app_footer.dart';
import '../Widgets/app_body_payment_container_widget.dart';
import '../Widgets/app_head_logo_widget.dart';
import '../Widgets/poster_widget.dart';
import '../../config.dart';

class HomePageBodyWidget extends StatelessWidget {
  HomePageBodyWidget({required this.homePageModel});

  final HomePageViewModel homePageModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppHeadLogoWidget(),
        AppBodyPaymentContainer(homePageModel: homePageModel,),
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
                      AppLocalization.of(context)!.translate('requestService'),
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
                  child: AppBodyNavigationContainer(AppLocalization.of(context)!.translate('addVehicle'), Icons.add),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MultiProvider(providers: <
                                    ChangeNotifierProvider<
                                        MyVehiclesListViewModel>>[
                                  ChangeNotifierProvider<
                                          MyVehiclesListViewModel>(
                                      create: (_) => MyVehiclesListViewModel())
                                ], child: MyVehicleHeadPageWidget())));
                  },
                  child: AppBodyNavigationContainer(
                      AppLocalization.of(context)!.translate('myVehicle'), Icons.car_rental),
                ),
                SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: () {},
                  child: AppBodyNavigationContainer(AppLocalization.of(context)!.translate('runningService'), Icons.run_circle),
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
