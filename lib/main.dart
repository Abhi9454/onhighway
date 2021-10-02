import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '/views/OurPlansPage/plans_head_page_widget.dart';
import '/views/ServiceHistoryPage/service_history_head_page_widget.dart';
import 'locale/localisation_service.dart';
import '/views/IntroPage/intro_head_page_widget.dart';
import '../views/HomePage/home_head_page_widget.dart';
import 'config.dart';

void main() async {
  await GetStorage.init();
  final _box = GetStorage();
  _box.writeIfNull("locale", "English");
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppConfig().appName,
      locale: LocalizationService().getCurrentLocale(),
      theme: ThemeData.light().copyWith(
          primaryColor: AppConfig().primary,
          scaffoldBackgroundColor: Colors.white,
          accentColor: AppConfig().primary),
      translations: LocalizationService(),
      home: IntroHeadPageWidget(),
    ),
  );
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
                icon: const Icon(Icons.history),
                label: "serviceHistory".tr,
                backgroundColor: AppConfig().primary),
            BottomNavigationBarItem(
                icon: const Icon(Icons.support_agent),
                label: "Our Plans",
                backgroundColor: AppConfig().primary),
          ],
        )));
  }

  @override
  Widget build(BuildContext context) {
    final LandingPageController landingPageController =
        Get.put(LandingPageController(), permanent: false);
    return Scaffold(
      bottomNavigationBar:
      buildBottomNavigationMenu(context, landingPageController),
      body: Obx(() => IndexedStack(
        index: landingPageController.tabIndex.value,
        children: [
          HomePageHeadWidget(),
          ServiceHistoryHeadPageWidget(),
          PlansHeadPageWidget(),
        ],
      )),
    );
  }
}
