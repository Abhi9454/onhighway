import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../RegistrationPage/registration_page_widget.dart';
import '/views/LoginPage/login_page_widget.dart';
import '../../helpers/clipper_clip_path.dart';
import '../../config.dart';

class IntroHeadPageWidget extends StatelessWidget {
  const IntroHeadPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig().primary,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.width,
            child: ClipPath(
              clipper: ClipPathClass(),
              child: Image(
                image: AssetImage(
                  'images/introPage.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Image(
                    image: AssetImage(
                      'images/on-highway-logo.png',
                    ),
                    fit: BoxFit.contain,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(LoginPageWidget());
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          primary: Color(0XFF091e6d)),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 50),
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: ElevatedButton(
                      onPressed: () {
                        Get.to(RegistrationPageWidget());
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                            color: AppConfig().primary,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          primary: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}


