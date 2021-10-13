import 'package:flutter/material.dart';
import '../../../config.dart';
class HomeTextWidget extends StatelessWidget {
  HomeTextWidget(this.linkText);

  final String linkText;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.width * 0.10,
      child: Center(
        child: Text(
          linkText,
          style: TextStyle(
              color: AppConfig().primary,
              fontSize: 14
          ),
        ),
      ),
    );
  }
}
