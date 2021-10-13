import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../viewModels/our_plans_view_model.dart';
import 'package:provider/provider.dart';
import '../OurPlansPage/plans_body_page_widget.dart';


class PlansHeadPageWidget extends StatelessWidget {
  const PlansHeadPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: ChangeNotifierProvider<OurPlansViewModel>(
          create: (_) => OurPlansViewModel(),
          child: Consumer<OurPlansViewModel>(
            builder: (con, ourPlansModel, _){
              return PlansBodyPageWidget(model: ourPlansModel);
            },
          ),
        ),
        //Stateless Body Widget
      ),
    );
  }
}
