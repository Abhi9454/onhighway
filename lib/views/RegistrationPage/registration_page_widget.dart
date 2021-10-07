import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../HomePage/widget/home_text_widget.dart';
import '../Widgets/app_head_logo_widget.dart';
import '../../config.dart';
class RegistrationPageWidget extends StatelessWidget {
  const RegistrationPageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50),
        child: AppBar(
          backgroundColor: AppConfig().secondary,
          leading: IconButton(
            icon: Icon(CupertinoIcons.back, color: AppConfig().primary),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            'Enter Details',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppHeadLogoWidget(),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Form(
                  child: Column(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppConfig().primary),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 5.0, bottom: 5.0),
                          child: TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.name,
                            style:
                            TextStyle(color: Colors.black, fontSize: 18),
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.person),
                              hintText: 'Name',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppConfig().primary),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 5.0, bottom: 5.0),
                          child: TextFormField(
                            autofocus: false,
                            keyboardType: TextInputType.emailAddress,
                            style:
                            TextStyle(color: Colors.black, fontSize: 18),
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.email),
                              hintText: 'Email',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppConfig().primary),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 5.0, bottom: 5.0),
                          child: TextFormField(
                            autofocus: false,
                            obscureText: true,
                            style:
                            TextStyle(color: Colors.black, fontSize: 18),
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.lock),
                              hintText: 'Password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: AppConfig().primary),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 15.0, right: 15, top: 5.0, bottom: 5.0),
                          child: TextFormField(
                            autofocus: false,
                            obscureText: true,
                            style:
                            TextStyle(color: Colors.black, fontSize: 18),
                            decoration: const InputDecoration(
                              icon: const Icon(Icons.lock),
                              hintText: 'Confirm Password',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.width * 0.12,
                        child: ElevatedButton(
                          onPressed: () {
                            print('Login Button');
                          },
                          child: Text('signUp'),
                          style: ElevatedButton.styleFrom(
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                            ),
                            primary: Color(0XFF091e6d),
                          ),
                        ),
                      ),
                      SizedBox(height: 15,),
                      HomeTextWidget('Already a member? Sign In'),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
