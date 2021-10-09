import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import '../../helpers/enum.dart';
import '../../views/IntroPage/intro_head_page_widget.dart';
import '../../viewModels/home_page_view_model.dart';
import 'package:provider/provider.dart';
import '../HomePage/home_body_page_widget.dart';

class HomePageHeadWidget extends StatelessWidget {
  const HomePageHeadWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<HomePageViewModel>(context, listen: false).init();
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<HomePageViewModel>(
        builder: (con, homePageModel, _) {
          return homePageModel.userStatus == HomePageUserStatus.userNotVerified
              ? const IntroHeadPageWidget()
              : SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: HomePageBodyWidget(homePageModel: homePageModel),
                );
        },
      ), //Stateless Body Widget,
    );
  }
}
