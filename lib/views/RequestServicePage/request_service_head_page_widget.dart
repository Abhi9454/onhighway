import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../RequestServicePage/request_service_body_page_widget.dart';
import '../../config.dart';

class RequestServiceHeadPageWidget extends StatelessWidget {
  const RequestServiceHeadPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: AppConfig().secondary,
          leading: IconButton(
            icon: Icon(CupertinoIcons.back, color: AppConfig().primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'requestService',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: RequestServiceBodyPageWidget(),
          //Stateless Body Widget
        ),
      ),
    );
  }
}
