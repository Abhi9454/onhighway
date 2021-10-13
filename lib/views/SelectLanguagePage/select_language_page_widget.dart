import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../locale/AppLanguage.dart';
import 'package:provider/provider.dart';

import '../../config.dart';
class SelectLanguagePageWidget extends StatelessWidget {
  const SelectLanguagePageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            'Select Language',
            textAlign: TextAlign.left,
            style: TextStyle(color: Colors.black, fontSize: 22),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            GestureDetector(
              onTap: (){
                Provider.of<AppLanguage>(context,listen: false).changeLanguage(Locale("hi"));
              },
              child: Card(
                elevation: 1,
                child: ListTile(
                  leading: Icon(Icons.language),
                  title: Text('English',textScaleFactor: 1.5,),
                ),
              ),
            ),
            SizedBox(height: 5,),
            GestureDetector(
              onTap: () {
                Provider.of<AppLanguage>(context,listen: false).changeLanguage(Locale("hi"));
              },
              child: Card(
                elevation: 2,
                child: ListTile(
                  leading: Icon(Icons.language),
                  title: Text('Hindi',textScaleFactor: 1.5,),

                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
