import 'package:flutter/material.dart';
import 'package:onhighway/config.dart';
import '../HomePage/widget/home_text_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class AppFooter extends StatelessWidget {
  const AppFooter({Key? key}) : super(key: key);

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                _launchInBrowser(AppConfig().webSiteLink);
              },
              child: HomeTextWidget('visitWebsite'),
            ),
            HomeTextWidget('  |  '),
            GestureDetector(
              onTap: () {
                _makePhoneCall(AppConfig().customerSupportNumber);
              },
              child: HomeTextWidget('contactSupport'),
            ),
          ],
        ),
      ),
    );
  }
}
