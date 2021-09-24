import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../HomePage/widget/home_text_widget.dart';
import '../HomePage/home_body_page_widget.dart';
import '../../config.dart';
import '../../helpers/clipper_clip_path.dart';

class HomePageHeadWidget extends StatelessWidget {
  const HomePageHeadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig().primary,
      body: Column(
        children: [
          SafeArea(
            child: ClipPath(
              clipper: ClipPathClass(),
              child: Container(
                color: Colors.white,
                height: MediaQuery.of(context).size.height * 0.9,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: HomePageBodyWidget(),  //Stateless Body Widget
                ),
              ), //Body Widget
            ),
          ),
          //bottom footer links
          Container(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HomeTextWidget('Visit Website|'),
                  HomeTextWidget('Contact Support|'),
                  HomeTextWidget('Our Terms|'),
                  HomeTextWidget('Plans and Features')
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
