import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../ServiceHistoryPage/service_history_body_page_widget.dart';

import '../../config.dart';

class ServiceHistoryHeadPageWidget extends StatelessWidget {
  const ServiceHistoryHeadPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: AppConfig().secondary,
          title: Text(
            'Service History',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ServiceHistoryBodyPageWidget(),
        //Stateless Body Widget
      ),
    );
  }
}
