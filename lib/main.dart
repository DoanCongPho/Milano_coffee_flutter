import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_coffee_app/cores/config/app_config.dart';
import 'package:flutter_coffee_app/cores/locator/locator.dart';
import 'package:flutter_coffee_app/cores/services/navigation_service.dart';
import 'package:flutter_coffee_app/firebase_options.dart';
import 'package:flutter_coffee_app/module/auth/login_page.dart';
import 'package:flutter_coffee_app/router/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );
  AppConfig.createByFlavor(flavor: Flavor.develop);
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await Locator.setupLocator(preferences);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Milano Coffee',
      navigatorKey: sl.get<NavigatorService>().navigationKey,
      onGenerateRoute: Routes.generateRoutes,
      theme: ThemeData(primarySwatch: Colors.brown),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
