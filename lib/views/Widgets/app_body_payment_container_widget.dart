import 'package:flutter/material.dart';
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
                  child: Text('My Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                  onPressed: () {
                    print('Pressed');
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                  ),
                ),
                SizedBox(width: 10,),
                OutlinedButton(
                  child: Text('Change Language',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                  onPressed: () {
                    print('Pressed Locale button' + homePageModel.getCurrentLocale().toString());
                    if(homePageModel.getCurrentLocale().toString() == 'en_US'){
                      homePageModel.changeLocale('Hindi');
                    }
                    else{
                      homePageModel.changeLocale('English');
                    }
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.white),
                    padding: const EdgeInsets.all(10)
                  ),
                ),
                SizedBox(width: 10,),
                OutlinedButton(
                  child: Text('Log out',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                  onPressed: () {
                    homePageModel.logout();
                  },
                  style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                      padding: const EdgeInsets.all(10)
                  ),
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
                    'Pending Payment : Rs. 3409',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: OutlinedButton(
                    child: Text('PAY NOW',textAlign: TextAlign.center,style: TextStyle(color: Colors.black),),
                    onPressed: () {
                      print('Pressed');
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: AppConfig().secondary
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
