import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../OurPlansPage/plans_body_page_widget.dart';


class PlansHeadPageWidget extends StatelessWidget {
  const PlansHeadPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: PlansBodyPageWidget(),
        //Stateless Body Widget
      ),
    );
  }
}
