import 'package:flutter/material.dart';
import 'package:onhighway/config.dart';
class HomeTextWidget extends StatelessWidget {
  HomeTextWidget(this.linkText);

  final String linkText;

  @override
  Widget build(BuildContext context) {
    return Text(
      linkText,
      style: TextStyle(
          color: AppConfig().primary,
          fontSize: 14
      ),
    );
  }
}
