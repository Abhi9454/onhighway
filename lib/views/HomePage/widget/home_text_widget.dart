import 'package:flutter/material.dart';
class HomeTextWidget extends StatelessWidget {
  HomeTextWidget(this.linkText);

  final String linkText;

  @override
  Widget build(BuildContext context) {
    return Text(
      linkText,
      style: TextStyle(
          color: Colors.white,
          fontSize: 12
      ),
    );
  }
}
