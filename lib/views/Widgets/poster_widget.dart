import 'package:flutter/material.dart';

class PosterWidget extends StatelessWidget {
  const PosterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 6,
      child: Image(
        image: AssetImage(
          'images/poster.jpg',
        ),
        fit: BoxFit.contain,
      ),
    );
  }
}
