import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'config.dart';
import '../views/RequestServicePage/request_service_head_page_widget.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    title: AppConfig().appName,
    home: RequestServiceHeadPageWidget(),
  ));
}
