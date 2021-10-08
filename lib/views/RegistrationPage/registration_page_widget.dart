import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../HomePage/widget/home_text_widget.dart';
import '../Widgets/app_head_logo_widget.dart';
import '../../config.dart';
import '../../helpers/enum.dart';
import '../../viewModels/register_view_model.dart';
import '../HomePage/home_head_page_widget.dart';
import 'package:provider/provider.dart';

class RegistrationPageWidget extends StatelessWidget {
  RegistrationPageWidget({Key? key}) : super(key: key);

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterPageViewModel>(
      create: (context) => RegisterPageViewModel(),
      child: Consumer<RegisterPageViewModel>(
        builder: (con, registerModel, _) {
          if (registerModel.registerStatus == RegisterStatus.success) {
            return HomePageHeadWidget();
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
                    'Enter Details',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 22),
                  ),
                ),
              ),
              body: SafeArea(
                child: registerModel.registerStatus == RegisterStatus.loading
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
                                        controller: nameController,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        decoration: const InputDecoration(
                                            hintText: 'Name',
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
                                      height: 10,
                                    ),
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
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15.0,
                                          right: 15,
                                          top: 5.0,
                                          bottom: 5.0),
                                      child: TextFormField(
                                        autofocus: false,
                                        controller: mobileController,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        decoration: const InputDecoration(
                                            hintText: 'Mobile Number',
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
                                      height: 10,
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
                                      height: 10,
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
                                        controller: confirmPasswordController,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 18),
                                        decoration: const InputDecoration(
                                            hintText: 'Confirm Password',
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
                                      height: 10,
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.5,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (nameController.text.isNotEmpty &&
                                              emailController.text.isNotEmpty &&
                                              mobileController
                                                  .text.isNotEmpty &&
                                              passwordController
                                                  .text.isNotEmpty &&
                                              confirmPasswordController
                                                  .text.isNotEmpty) {
                                            if (passwordController.text ==
                                                confirmPasswordController
                                                    .text) {
                                              registerModel.register(
                                                  nameController.text,
                                                  emailController.text,
                                                  mobileController.text,
                                                  passwordController.text);
                                            } else {
                                              final snackBar = SnackBar(
                                                content: const Text(
                                                  'Password and Confirm Password do not match',
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
                                        child: Text('signUp'),
                                        style: ElevatedButton.styleFrom(
                                          shape: new RoundedRectangleBorder(
                                            borderRadius:
                                                new BorderRadius.circular(5.0),
                                          ),
                                          primary: Color(0XFF091e6d),
                                          padding: const EdgeInsets.all(15),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    HomeTextWidget('Already a member? Sign In'),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    registerModel.registerStatus ==
                                            RegisterStatus.failed
                                        ? Text(
                                            registerModel.registerErrorMessage,
                                            style: TextStyle(
                                                color: Colors.red,
                                                fontSize: 18),
                                          )
                                        : registerModel.registerStatus ==
                                                RegisterStatus.error
                                            ? Text(
                                                registerModel.error.message,
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
