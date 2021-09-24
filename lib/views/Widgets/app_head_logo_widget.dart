import 'package:flutter/material.dart';

class AppHeadLogoWidget extends StatelessWidget {
  const AppHeadLogoWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Image(
          image: AssetImage(
            'images/on-highway-logo.png',             //header logo image
          ),
          fit: BoxFit.contain,
          width: 120,
          height: 120,
        ),
      ),
    );
  }
}
