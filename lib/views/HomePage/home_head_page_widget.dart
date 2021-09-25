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
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              HomePageBodyWidget(),
            ],
          ), //Stateless Body Widget
        ),
      ),
    );
  }
}
