import 'package:flutter/material.dart';
import 'package:onhighway/locale/AppLanguage.dart';
import 'package:onhighway/viewModels/my_profile_view_model.dart';
import 'package:onhighway/views/MyProfilePage/my_profile_page.dart';
import 'package:provider/provider.dart';
import '../../viewModels/home_page_view_model.dart';
import '../../../config.dart';

class AppBodyPaymentContainer extends StatelessWidget {
  AppBodyPaymentContainer({required this.homePageModel});

  final HomePageViewModel homePageModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConfig().onPrimary,
      height: MediaQuery.of(context).size.height / 5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  child: Text(
                    'My Profile',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MultiProvider(providers: <
                                    ChangeNotifierProvider<MyProfileViewModel>>[
                                  ChangeNotifierProvider<MyProfileViewModel>(
                                      create: (_) => MyProfileViewModel())
                                ], child: MyProfilePageWidget())));
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                OutlinedButton(
                  child: Text(
                    'Change Language',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                  onPressed: () async {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => SelectLanguagePageWidget()));
                    String locale = await homePageModel.getCurrentLocale();
                    if (locale == 'hi') {
                      Provider.of<AppLanguage>(context, listen: false)
                          .changeLanguage(Locale('en'));
                    } else {
                      Provider.of<AppLanguage>(context, listen: false)
                          .changeLanguage(Locale('hi'));
                    }
                  },
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                      padding: const EdgeInsets.all(10)),
                ),
                SizedBox(
                  width: 10,
                ),
                OutlinedButton(
                  child: Text(
                    'Log out',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.normal),
                  ),
                  onPressed: () {
                    homePageModel.logout();
                  },
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                      padding: const EdgeInsets.all(10)),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'Pending Payment : Rs. ' +
                        homePageModel.totalPendingAmount.toString(),
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                homePageModel.totalPendingAmount > 0 ? Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: OutlinedButton(
                    child: Text(
                      'PAY NOW',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.black),
                    ),
                    onPressed: () {
                      print('Pressed');
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: AppConfig().secondary),
                  ),
                ) : SizedBox()
              ],
            ),
          )
        ],
      ),
    );
  }
}
