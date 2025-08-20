import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_coffee_app/cores/config/app_config.dart';
import 'package:flutter_coffee_app/cores/locator/locator.dart';
import 'package:flutter_coffee_app/firebase_options.dart';
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
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(await builder());
}
