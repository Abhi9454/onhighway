import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onhighway/views/ForgetPasswordPage/forget_password_page_widget.dart';
import '../../locale/app_localization.dart';
import '../../main.dart';
import '../../helpers/enum.dart';
import '../../viewModels/login_view_model.dart';
import 'package:provider/provider.dart';
import '../../config.dart';
import '../HomePage/widget/home_text_widget.dart';
import '/views/Widgets/app_head_logo_widget.dart';

class LoginPageWidget extends StatelessWidget {
  LoginPageWidget({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginPageViewModel>(
      create: (context) => LoginPageViewModel(),
      child: Consumer<LoginPageViewModel>(
        builder: (con, model, _) {
          if (model.loginStatus == LoginStatus.success) {
            return HomePage();
          } else {
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
                    'Welcome Back',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ),
              ),
              body: SafeArea(
                child: model.loginStatus == LoginStatus.loading
                    ? SizedBox(
                        child: Center(child: CircularProgressIndicator()),
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
                                            hintText: 'Email/Mobile',
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
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: TextFormField(
                                        autofocus: false,
                                        obscureText: true,
                                        controller: passwordController,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        decoration: const InputDecoration(
                                            hintText: 'Password',
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
                                            model.login(emailController.text,
                                                passwordController.text);
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
                                        child: Text(
                                            AppLocalizations.of(context)!
                                                .translate('signIn')!),
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
                                                      ForgetPasswordPageWidget()));
                                        },
                                        child:
                                            HomeTextWidget('Forget Password')),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    model.loginStatus == LoginStatus.failed
                                        ? Text(
                                            model.errorMessage,
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
              ),
            );
          }
        },
      ),
    );
  }
}
