import 'package:flutter/material.dart';

class HomePagePosterWidget extends StatelessWidget {
  const HomePagePosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Container(
        height: MediaQuery.of(context).size.height / 6,
        child: Image(
          image: AssetImage(
            'images/poster.jpg',
          ),
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
