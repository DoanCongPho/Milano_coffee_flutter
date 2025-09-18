import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_coffee_app/cores/config/app_config.dart';
import 'package:flutter_coffee_app/cores/locator/locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> bootstrap(
  Flavor flavor,
  FutureOr<Widget> Function() builder,
) async {
  FlutterError.onError = (details) {};

  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  AppConfig.createByFlavor(flavor: flavor);
  final SharedPreferences preferences = await SharedPreferences.getInstance();
  await Locator.setupLocator(preferences);

  runApp(await builder());
}
