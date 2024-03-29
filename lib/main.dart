import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../viewModels/google_map_view_model.dart';
import '../../locale/app_localization.dart';
import '../../viewModels/service_history_view_model.dart';
import '../helpers/enum.dart';
import '../viewModels/auth_view_model.dart';
import '../../views/IntroPage/intro_head_page_widget.dart';
import '/viewModels/home_page_view_model.dart';
import 'package:provider/provider.dart';
import '/views/OurPlansPage/plans_head_page_widget.dart';
import '/views/ServiceHistoryPage/service_history_head_page_widget.dart';
import '../views/HomePage/home_head_page_widget.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'config.dart';
import 'locale/AppLanguage.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Importance Notifications', // title// description
  importance: Importance.high,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
FlutterLocalNotificationsPlugin();


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppLanguage appLanguage = AppLanguage();
  await appLanguage.fetchLocale();
  await Firebase.initializeApp();
  SharedPreferences.setMockInitialValues({});
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
      AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  runApp(MyApp(
    appLanguage: appLanguage,
  ));
}


class MyApp extends StatelessWidget {
  final AppLanguage appLanguage;

  MyApp({required this.appLanguage});



  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AppLanguage>(
      create: (_) => appLanguage,
      child: Consumer<AppLanguage>(
        builder: (context, currentDataModel, _) {
          return MaterialApp(
              theme: ThemeData(
                  primaryColor: AppConfig().primary,
                  scaffoldBackgroundColor: Colors.white,
                  colorScheme: ColorScheme.fromSwatch()
                      .copyWith(secondary: AppConfig().primary)),
              debugShowCheckedModeBanner: false,
              title: AppConfig().appName,
              locale: currentDataModel.appLocal,
              supportedLocales: [
                const Locale('en', ''), // English
                const Locale('hi', ''), // Hindi
              ],
              localizationsDelegates: [
                AppLocalizations.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
              ],
              home: MultiProvider(providers: [
                ChangeNotifierProvider(create: (context) => HomePageViewModel()),
                ChangeNotifierProvider(create: (context) => ServiceHistoryViewModel()),
                ChangeNotifierProvider(create: (context) => GoogleMapViewModel()),
              ],
                child: HomePage(),
              ));
        },
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AuthViewModel>(
      create: (context) => AuthViewModel(),
      child: Consumer<AuthViewModel>(
        builder: (context, model, _) {
          model.loginStatus();
          if (model.status == Status.failed) {
            return const IntroHeadPageWidget();
          } else {
            return const NavigationTab();
          }
        },
      ),
    );
  }
}

class NavigationTab extends StatefulWidget {
  const NavigationTab({Key? key}) : super(key: key);

  @override
  _NavigationTabState createState() => _NavigationTabState();
}

class _NavigationTabState extends State<NavigationTab> {
  int _currentIndex = 0;
  final List<Widget> _children = <Widget>[
    ChangeNotifierProvider<HomePageViewModel>(
      create: (_) => HomePageViewModel(),
      child: const HomePageHeadWidget(),
    ),
    ChangeNotifierProvider<ServiceHistoryViewModel>(
      create: (_) => ServiceHistoryViewModel(),
      child: ServiceHistoryHeadPageWidget(),
    ),
    const PlansHeadPageWidget(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        // new
        currentIndex: _currentIndex,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: AppConfig().secondary,
        unselectedFontSize: 14,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: const Icon(Icons.home),
              label: AppLocalizations.of(context)!.translate('home'),
              backgroundColor: AppConfig().primary),
          BottomNavigationBarItem(
              icon: const Icon(Icons.history),
              label: AppLocalizations.of(context)!.translate('serviceHistory'),
              backgroundColor: AppConfig().primary),
          BottomNavigationBarItem(
              icon: const Icon(Icons.support_agent),
              label: AppLocalizations.of(context)!.translate('ourPlans'),
              backgroundColor: AppConfig().primary),
        ],
      ),
    );
  }
}
