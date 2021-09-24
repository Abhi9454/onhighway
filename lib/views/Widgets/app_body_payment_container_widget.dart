import 'package:flutter/material.dart';
import '../../../config.dart';

class AppBodyPaymentContainer extends StatelessWidget {
  const AppBodyPaymentContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppConfig().onPrimary,
      height: MediaQuery.of(context).size.height / 6,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height / 16,
                  child: OutlinedButton(
                    child: Text('My Profile',style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                    onPressed: () {
                      print('Pressed');
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height / 16,
                  child: OutlinedButton(
                    child: Text('Service History',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                    onPressed: () {
                      print('Pressed');
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height / 16,
                  child: OutlinedButton(
                    child: Text('Change Language',textAlign: TextAlign.center,style: TextStyle(color: Colors.white,fontWeight: FontWeight.normal),),
                    onPressed: () {
                      print('Pressed');
                    },
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Colors.white),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                child: Text(
                  'Pending Payment : Rs. 3409',
                  style: TextStyle(
                      fontSize: 20,
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
          )
        ],
      ),
    );
  }
}
