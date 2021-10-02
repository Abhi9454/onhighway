import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../config.dart';

class RunningServiceHeadPageWidget extends StatelessWidget {
  const RunningServiceHeadPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: AppConfig().secondary,
          leading: IconButton(
            icon: Icon(CupertinoIcons.back, color: AppConfig().primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Running Services',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
    );
  }
}
