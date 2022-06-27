import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../locale/AppLanguage.dart';
import '../LoginPage/login_page_widget.dart';
import '../RegistrationPage/registration_page_widget.dart';
import '../../helpers/clipper_clip_path.dart';
import '../../config.dart';
import '../../locale/app_localization.dart';

class IntroHeadPageWidget extends StatelessWidget {
  const IntroHeadPageWidget({Key? key}) : super(key: key);

  showLanguageDialog(BuildContext context) async{
    return showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Language Select"),
        content: Text("Select the application Language"),
        actions: [
          ElevatedButton(onPressed: (){
            Provider.of<AppLanguage>(context, listen: false)
                .changeLanguage(Locale('en'));
            Navigator.of(context).pop();
          }, child: Text('English')),
          ElevatedButton(onPressed: (){
            Provider.of<AppLanguage>(context, listen: false)
                .changeLanguage(Locale('hi'));
            Navigator.of(context).pop();
          }, child: Text('Hindi')),

        ],
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppConfig().primary,
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.width,
            child: ClipPath(
              clipper: ClipPathClass(),
              child: Image(
                image: AssetImage(
                  'images/introPage.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 100),
                  child: Image(
                    image: AssetImage(
                      'images/on-highway-logo.png',
                    ),
                    fit: BoxFit.contain,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      onPressed: () {
                        showLanguageDialog(context);
                      },
                      child: Text(
                        AppLocalizations.of(context)!.translate('changeLanguage')!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          padding: const EdgeInsets.all(15),
                          primary: Colors.white24),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPageWidget()));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.translate('signIn')!,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          padding: const EdgeInsets.all(15),
                          primary: Color(0XFF091e6d)),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: const EdgeInsets.only(bottom: 80),
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    RegistrationPageWidget()));
                      },
                      child: Text(
                        AppLocalizations.of(context)!.translate('signUp')!,
                        style: TextStyle(
                            color: AppConfig().primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                          shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(30.0),
                          ),
                          padding: const EdgeInsets.all(15),
                          primary: Colors.white),
                    ),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
