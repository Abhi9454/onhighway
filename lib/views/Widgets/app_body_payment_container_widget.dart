import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../../locale/localisation_service.dart';
import '../../../config.dart';

class AppBodyPaymentContainer extends StatelessWidget {
  const AppBodyPaymentContainer({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    final _box = GetStorage();
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
                    print('Pressed Locale button');
                    if(_box.read('locale') == 'English'){
                      LocalizationService().changeLocale('Hindi');
                    }
                    else{
                      LocalizationService().changeLocale('English');
                    }
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
