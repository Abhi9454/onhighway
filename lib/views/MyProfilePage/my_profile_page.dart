import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onhighway/helpers/enum.dart';
import 'package:onhighway/viewModels/my_profile_view_model.dart';
import 'package:onhighway/views/Widgets/app_head_logo_widget.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
class MyProfilePageWidget extends StatelessWidget {
  const MyProfilePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<MyProfileViewModel>(context,listen: false).fetchUserProfile();
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
            'User Profile',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
      body: Consumer<MyProfileViewModel>(
        builder: (con, myProfileModel, _){
          if(myProfileModel.status == Status.loading){
            return SizedBox(
              child: Center(child: CircularProgressIndicator()),
            );
          }
          else{
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  AppHeadLogoWidget(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 1,
                      child: ListTile(
                        leading: Icon(Icons.email),
                        title: Text('Email : '+ myProfileModel.userProfile.userEmail),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 1,
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Name : '+ myProfileModel.userProfile.userName),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 1,
                      child: ListTile(
                        leading: Icon(Icons.mobile_friendly_rounded),
                        title: Text('Mobile Number : '+ myProfileModel.userProfile.userMobile),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
