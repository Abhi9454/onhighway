import 'package:flutter/material.dart';
import '../HomePage/widget/home_text_widget.dart';
import 'package:get/get.dart';
class AppFooter extends StatelessWidget {
  const AppFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            HomeTextWidget('visitWebsite'.tr + ' | '),
            HomeTextWidget('contactSupport'.tr),
          ],
        ),
      ),
    );
  }
}
