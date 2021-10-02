import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:get/get.dart';
import 'package:onhighway/main.dart';
import '../IntroPage/intro_head_page_widget.dart';
import '../../config.dart';
import '../HomePage/widget/home_text_widget.dart';
import '/views/Widgets/app_head_logo_widget.dart';

class LoginPageWidget extends StatelessWidget {
  const LoginPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: AppConfig().secondary,
          leading: IconButton(
            icon: Icon(CupertinoIcons.back, color: AppConfig().primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Welcome Back',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppHeadLogoWidget(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, top: 5.0, bottom: 5.0),
                        child: TextFormField(
                          autofocus: false,
                          obscureText: true,
                          style:
                              TextStyle(color: Colors.black, fontSize: 18),
                          decoration: const InputDecoration(
                            hintText: 'Email',
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                              )
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 15.0, right: 15, top: 5.0, bottom: 5.0),
                        child: TextFormField(
                          autofocus: false,
                          obscureText: true,
                          style:
                              TextStyle(color: Colors.black, fontSize: 18),
                          decoration: const InputDecoration(
                            hintText: 'Password',
                              enabledBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: const BorderSide(color: Colors.grey, width: 0.0),
                              )
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.offAll(() => LandingPage());
                          },
                          child: Text('signIn'.tr),
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            padding: const EdgeInsets.all(15),
                            primary: Color(0XFF091e6d),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      HomeTextWidget('Forget Password'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
