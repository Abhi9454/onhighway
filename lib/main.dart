import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:onhighway/views/IntroPage/intro_head_page_widget.dart';
import '/views/RequestServicePage/request_service_head_page_widget.dart';
import '../views/HomePage/home_head_page_widget.dart';
import 'config.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: AppConfig().appName,
    home: IntroHeadPageWidget(),
  ));
}

class LandingPageController extends GetxController {
  var tabIndex = 0.obs;

  void changeTabIndex(int index) {
    tabIndex.value = index;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class LandingPage extends StatelessWidget {
  buildBottomNavigationMenu(context, landingPageController) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: BottomNavigationBar(
          showUnselectedLabels: true,
          showSelectedLabels: true,
          onTap: landingPageController.changeTabIndex,
          currentIndex: landingPageController.tabIndex.value,
          selectedItemColor: AppConfig().secondary,
          unselectedFontSize: 14,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: const Icon(Icons.home),
                label: "Home",
                backgroundColor: AppConfig().primary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.cloud_upload),
                label: "My Vehicles",
                backgroundColor: AppConfig().primary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.support_agent),
                label: "History",
                backgroundColor: AppConfig().primary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.settings),
                label: "Settings",
                backgroundColor: AppConfig().primary)
          ],
        )));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar:
          buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
            index: landingPageController.tabIndex.value,
            children: [
              HomePageHeadWidget(),
              RequestServiceHeadPageWidget(),
              HomePageHeadWidget(),
              RequestServiceHeadPageWidget(),
            ],
          )),
    ));
  }
}
