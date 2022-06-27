import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onhighway/viewModels/request_service_view_model.dart';
import 'package:onhighway/viewModels/vehicle_load_view_model.dart';
import 'package:onhighway/views/RequestServicePage/request_service_head_page_widget.dart';
import 'package:onhighway/views/VehicleLoadPage/vehicle_load_head_page_widget.dart';
import '../../viewModels/running_service_view_model.dart';
import '../../views/RunningServicePage/running_service_head_page_widget.dart';
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
        AppBodyPaymentContainer(
          homePageModel: homePageModel,
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MultiProvider(providers: <
                                ChangeNotifierProvider<
                                    RequestServiceViewModel>>[
                              ChangeNotifierProvider<RequestServiceViewModel>(
                                  create: (_) => RequestServiceViewModel())
                            ], child: RequestServiceHeadPageWidget())));
              },
              child: Container(
                color: AppConfig().secondary,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      AppLocalizations.of(context)!
                          .translate('requestService')!,
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
            padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
                  child: AppBodyNavigationContainer(
                      AppLocalizations.of(context)!.translate('addVehicle')!,
                      Icons.add),
                ),
                SizedBox(
                  width: 2,
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
                      AppLocalizations.of(context)!.translate('myVehicle')!,
                      Icons.car_rental),
                ),
                SizedBox(
                  width: 2,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MultiProvider(providers: <
                                    ChangeNotifierProvider<
                                        RunningServiceViewModel>>[
                                  ChangeNotifierProvider<
                                          RunningServiceViewModel>(
                                      create: (_) => RunningServiceViewModel())
                                ], child: RunningServiceHeadPageWidget())));
                  },
                  child: AppBodyNavigationContainer(
                      AppLocalizations.of(context)!
                          .translate('runningService')!,
                      Icons.run_circle),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => MultiProvider(providers: <
                            ChangeNotifierProvider<
                                VehicleLoadViewModel>>[
                          ChangeNotifierProvider<VehicleLoadViewModel>(
                              create: (_) => VehicleLoadViewModel())
                        ], child: VehicleLoadHeadPageWidget())));
              },
              child: Container(
                color: AppConfig().secondary,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      AppLocalizations.of(context)!.translate('viewLoad')!,
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
          height: 10,
        ),
        PosterWidget(),
        AppFooter()
      ],
    );
  }
}
