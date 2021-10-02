import 'package:flutter/material.dart';
import 'package:onhighway/views/Widgets/app_head_logo_widget.dart';
import '../../config.dart';

class PlansBodyPageWidget extends StatelessWidget {
  const PlansBodyPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppHeadLogoWidget(),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Colors.white70,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Joining Fees',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    'WHEN ANYONE REGISTER THEIR TRUCK, BUS, CAR WITH OUR APP ALL SERVICES CAN REQUEST ONLY AFTER PAYING JOINING FEE WHICH IS ONE TIME FEE',
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Center(
                    child: Text(
                      'Rs. 3000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Center(
                    child: Text(
                      'Vehicle Lifetime Register',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                  ),
                  const SizedBox(height: 2,),
                  Center(
                    child: Text(
                      'Request Vehicle Service',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {},
                      child: Text(
                        'Pay Now'
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: AppConfig().primary
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Card(
            color: Colors.white70,
            elevation: 2,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'SERVICE CONTINUE FEE',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),
                    ),
                  ),
                  const SizedBox(height: 10,),
                  Text(
                    'FROM NEXT MONTH CUSTOMER WILL GET REMINDER FOR MAKING MONTHLY PAYMENT OF RS. 1000/- AND ITS MANDATORY TO PAY TO REQUEST FOR ANY SERVICE',
                    maxLines: 5,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 13
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Center(
                    child: Text(
                      'Rs. 1,000',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20
                      ),
                    ),
                  ),
                  const SizedBox(height: 5,),
                  Center(
                    child: Text(
                      'Request Service Anytime',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                  ),
                  const SizedBox(height: 2,),
                  Center(
                    child: Text(
                      'Request Service From Anywhere',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
