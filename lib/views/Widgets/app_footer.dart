import 'package:flutter/material.dart';
import '../HomePage/widget/home_text_widget.dart';

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
            HomeTextWidget('Visit Website | '),
            HomeTextWidget('Contact Support'),
          ],
        ),
      ),
    );
  }
}
