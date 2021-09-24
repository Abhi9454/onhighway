import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Widgets/app_body_payment_container_widget.dart';
import '../Widgets/app_head_logo_widget.dart';
import '../HomePage/widget/poster_widget.dart';
import '../../config.dart';

class HomePageBodyWidget extends StatelessWidget {
  const HomePageBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppHeadLogoWidget(),
        AppBodyPaymentContainer(),   // Header Box
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: AppConfig().secondary,
                width: MediaQuery.of(context).size.width * 0.5,
                height: MediaQuery.of(context).size.height / 6,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Request a new service',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                color: AppConfig().secondary,
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height / 6,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      'Running services',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 15
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                color: AppConfig().onPrimary,
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height / 7,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 5.0),
                        child: Icon(Icons.add,size: 20,color: Colors.white,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'Add a new vehicle',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                color: AppConfig().onPrimary,
                width: MediaQuery.of(context).size.width * 0.25,
                height: MediaQuery.of(context).size.height / 7,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0,bottom: 5.0),
                        child: Icon(Icons.car_repair,size: 20,color: Colors.white,),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          'View vehicles added',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {
                  print('Service History Box');
                },
                child: Container(
                  color: AppConfig().onPrimary,
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height / 7,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0,bottom: 5.0),
                          child: Icon(Icons.history,size: 20,color: Colors.white,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10.0,right: 5.0,left: 5.0),
                          child: Text(
                            'Service History',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
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
          ),
        ),
        HomePagePosterWidget(),    //Bottom Poster
      ],
    );
  }
}
