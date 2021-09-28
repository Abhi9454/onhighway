import 'package:flutter/material.dart';
import '../Widgets/app_footer.dart';
import '../Widgets/poster_widget.dart';
import '../../config.dart';
import '../Widgets/app_body_payment_container_widget.dart';
import '../Widgets/app_head_logo_widget.dart';

class AddNewVehicleBodyWidget extends StatelessWidget {
  const AddNewVehicleBodyWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        AppHeadLogoWidget(),
        AppBodyPaymentContainer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            color: AppConfig().secondary,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Enter Details',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.black, fontSize: 22),
              ),
            ),
          ),
        ),
        PosterWidget(),
        AppFooter() //Footer
      ],
    );
  }
}
