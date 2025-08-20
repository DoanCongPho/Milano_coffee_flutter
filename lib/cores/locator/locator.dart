import 'package:dio/dio.dart';
import 'package:flutter_coffee_app/cores/config/app_config.dart';
import 'package:flutter_coffee_app/cores/network/api/auth.api.dart';
import 'package:flutter_coffee_app/cores/network/api/home.api.dart';
import 'package:flutter_coffee_app/cores/network/client.dart';
import 'package:flutter_coffee_app/cores/pref/store_service.dart';
import 'package:flutter_coffee_app/cores/repositories/auth_repository.dart';
import 'package:flutter_coffee_app/cores/repositories/banner_repository.dart';
import 'package:flutter_coffee_app/cores/services/navigation_service.dart';
import 'package:flutter_coffee_app/module/auth/cubit/login_cubit.dart';
import 'package:flutter_coffee_app/module/home_page/cubit/home_cubit.dart';
import 'package:flutter_coffee_app/module/main_page/cubit/main_cubit.dart';
import 'package:flutter_coffee_app/widget/loading.dart';

import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final sl = GetIt.instance;

class Locator {
  static Future<void> setupLocator(SharedPreferences preferences) async {
    await injectHelper();
    await injectService(preferences);
    await injectNetwork();
    await injectApi();
    await injectRepositories();
    await injectBloc();
  }

  static Future<void> injectService(SharedPreferences preferences) async {
    sl
      ..registerLazySingleton(NavigatorService.new)
      ..registerLazySingleton<StoreService>(() => StoreServiceImp(preferences));
  }

  static Future<void> injectNetwork() async {
    final baseUrl = AppConfig.instance.settings.baseApi;
    final dio = AppClient.buildDioClient(baseUrl);
    sl.registerLazySingleton(() => dio);
  }

  static Future<void> injectApi() async {
    sl
      ..registerLazySingleton(() => AuthAPI(sl.get<Dio>()))
      ..registerLazySingleton(() => HomeAPI(sl.get<Dio>()));
    // ..registerLazySingleton(() => ContainerService(sl.get<Dio>()));
  }

  static Future<void> injectRepositories() async {
    sl
      ..registerLazySingleton(
        () => AuthRepositoryImp(authService: sl.get<AuthAPI>()),
      )
      ..registerLazySingleton(() => HomeRepository(sl.get<HomeAPI>()));
  }

  static Future<void> injectHelper() async {
    sl
      // ..registerLazySingleton(() => AlertPopup())
      ..registerLazySingleton(() => Loading());
  }

  static Future<void> injectBloc() async {
    sl
      ..registerFactory(() => LoginCubit(sl.get<AuthRepositoryImp>()))
      ..registerFactory(() => HomeCubit(sl.get<HomeRepository>()))
      ..registerFactory(() => NavigationCubit());
  }
}
