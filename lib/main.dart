import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_coffee_app/cores/config/app_config.dart';
import 'package:flutter_coffee_app/cores/locator/locator.dart' as app_locator;
import 'package:flutter_coffee_app/cores/network/api/firebase_api.dart';
import 'package:flutter_coffee_app/cores/services/navigation_service.dart';
import 'package:flutter_coffee_app/module/auth/login_page.dart';
import 'package:flutter_coffee_app/router/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_coffee_app/provider/google_signIn_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_coffee_app/provider/facebook_sign_in.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  AppConfig.createByFlavor(flavor: Flavor.develop);
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await app_locator.Locator.setupLocator(preferences);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final firebaseApi = FirebaseApi();
  await firebaseApi.initNotifications();

  FlutterError.onError = (FlutterErrorDetails errorDetails) {
    FlutterError.presentError(errorDetails);
    FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
    return true;
  };

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => GoogleSigninProvider()),
        ChangeNotifierProvider(create: (_) => FacebookSignInProvider()),
      ],
      child: MaterialApp(
        title: 'Milano Coffee',
        navigatorKey: app_locator.sl.get<NavigatorService>().navigationKey,
        onGenerateRoute: Routes.generateRoutes,
        theme: ThemeData(primarySwatch: Colors.brown),
        home: LoginPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
