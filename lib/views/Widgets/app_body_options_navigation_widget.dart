import 'package:flutter/material.dart';

import '../../config.dart';
class AppBodyNavigationContainer extends StatelessWidget {
  AppBodyNavigationContainer(this.containerText,this.icon);

  final String containerText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.3,
      height: MediaQuery.of(context).size.width * 0.3,
      color: AppConfig().onPrimary,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 5.0),
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Text(
                  containerText,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
