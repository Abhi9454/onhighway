import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import '../../views/LoginPage/login_page_widget.dart';
import '../../viewModels/forget_password_view_model.dart';
import '../../helpers/enum.dart';
import 'package:provider/provider.dart';
import '../../config.dart';
import '../HomePage/widget/home_text_widget.dart';
import '/views/Widgets/app_head_logo_widget.dart';

class ForgetPasswordPageWidget extends StatelessWidget {
  ForgetPasswordPageWidget({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ForgetPasswordViewModel>(
      create: (context) => ForgetPasswordViewModel(),
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: AppBar(
            backgroundColor: AppConfig().secondary,
            leading: IconButton(
              icon: Icon(CupertinoIcons.back, color: AppConfig().primary),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: Text(
              'Forget Password',
              textAlign: TextAlign.left,
              style: TextStyle(color: Colors.black, fontSize: 22),
            ),
          ),
        ),
        body: Consumer<ForgetPasswordViewModel>(builder: (con, model, _) {
          return SafeArea(
            child: model.loginStatus == LoginStatus.loading
                ? SizedBox(
                    child: Center(child: CircularProgressIndicator()),
                  )
                : model.loginStatus == LoginStatus.success
                    ? SizedBox(
                        child: Center(
                            child: Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Text(
                          model.replyStatus['message'].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                            )),
                      )
                    : SingleChildScrollView(
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
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: TextFormField(
                                        autofocus: false,
                                        controller: emailController,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        decoration: const InputDecoration(
                                            hintText: 'Email',
                                            enabledBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            ),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                              borderSide: const BorderSide(
                                                  color: Colors.grey,
                                                  width: 0.0),
                                            )),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (emailController.text.isNotEmpty &&
                                              emailController.text.isNotEmpty) {
                                            model.forgetPassword(
                                                emailController.text);
                                          } else {
                                            final snackBar = SnackBar(
                                              content: const Text(
                                                'Empty Fields....',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    color: Colors.white),
                                              ),
                                              backgroundColor:
                                                  (AppConfig().primary),
                                            );
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(snackBar);
                                          }
                                        },
                                        child: Text('Send Reset Email'),
                                        style: ElevatedButton.styleFrom(
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0),
                                          ),
                                          padding: const EdgeInsets.all(15),
                                          primary: Color(0XFF091e6d),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPageWidget()));
                                        },
                                        child: HomeTextWidget('Login')),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    model.loginStatus == LoginStatus.failed
                                        ? Text(
                                            model.replyStatus['message']
                                                .toString(),
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18),
                                          )
                                        : model.loginStatus == LoginStatus.error
                                            ? Text(
                                                model.error.message,
                                                style: TextStyle(
                                                    color: Colors.red,
                                                    fontSize: 18),
                                              )
                                            : SizedBox()
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
          );
        }),
      ),
    );
  }
}
