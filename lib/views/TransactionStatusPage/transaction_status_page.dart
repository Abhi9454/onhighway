import 'package:flutter/material.dart';
import 'package:onhighway/config.dart';
import '../../views/Widgets/app_head_logo_widget.dart';

class TransactionStatusPageWidget extends StatelessWidget {
  TransactionStatusPageWidget({required this.transactionStatus});

  final String transactionStatus;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            AppHeadLogoWidget(),
            SizedBox(
              height: 10,
            ),
            Text(transactionStatus,
                style: TextStyle(
                  color: AppConfig().primary,
                  fontSize: 18,
                )),
          ],
        ),
      ),
    );
  }
}
