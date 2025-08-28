import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee_app/cores/locator/locator.dart';
import 'package:flutter_coffee_app/cores/repositories/home_repository.dart';
import 'package:flutter_coffee_app/module/Qr/qr_page.dart';
import 'package:flutter_coffee_app/module/home_page/cubit/home_cubit.dart';
import 'package:flutter_coffee_app/module/main_page/cubit/main_cubit.dart';
import 'package:flutter_coffee_app/module/main_page/main_page.dart';
import 'package:flutter_coffee_app/module/other/update_profile_page.dart';

class Routes {
  static const loginPage = '/login_page';
  static const mainPage = '/main_page';
  static const homePage = '/home_page';
  static const detailPage = '/news_page';
  static const qrPage = '/qr_page';
  static const otherPage = '/other_page';
  static const orderPage = '/order_page';
  static const voucherPage = '/vochor_page';

  static Route<dynamic> generateRoutes(RouteSettings settings) {
    switch (settings.name) {
      // case mainPage:
      //   return MaterialPageRoute(
      //     settings: settings,
      //     builder: (_) => BlocProvider(
      //       create: (_) => sl.get<NavigationCubit>(),
      //       child: MainPage(),
      //     ),
      //   );
      case mainPage:
        return MaterialPageRoute(
          builder: (_) => MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => HomeCubit(sl.get<HomeRepository>())..initAPI(),
              ),
              BlocProvider(create: (_) => sl.get<NavigationCubit>()),
            ],
            child: MainPage(),
          ),
        );

      case homePage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (_) => HomeCubit(sl.get<HomeRepository>())..loadUserData(),
            child: MainPage(),
          ),
        );
      case qrPage:
        return MaterialPageRoute(
          settings: settings, // nếu muốn giữ thông tin route
          builder: (_) => BlocProvider(
            create: (_) => HomeCubit(sl.get<HomeRepository>())..loadUserData(),
            child: QRPage(),
          ),
        );

      case otherPage:
        return MaterialPageRoute(
          settings: settings, // nếu muốn giữ thông tin route
          builder: (_) => UpdateProfilePage(),
        );

      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
