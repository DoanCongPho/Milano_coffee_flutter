import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/cores/locator/locator.dart';
import 'package:flutter_coffee_app/cores/services/navigation_service.dart';
import 'package:loading_indicator/loading_indicator.dart';

class Loading {
  bool _isShowingDialog = false;
  Future<void> show() async {
    _isShowingDialog = true;
    final result = await showDialog<dynamic>(
      barrierDismissible: false,
      context: sl.get<NavigatorService>().navigationKey.currentContext!,
      builder: (ctx) {
        return Center(
          child: SizedBox(
            width: 100,
            height: 100,
            child: LoadingIndicator(
              indicatorType: Indicator.ballRotateChase,
              colors: const [
                Colors.white,
                Colors.amberAccent,
                Colors.cyan,
                Colors.pink,
                Colors.tealAccent,
                Colors.greenAccent,
                Colors.purpleAccent,
              ],
              strokeWidth: 2,
            ),
          ),
        );
      },
    );
    _isShowingDialog = false;
    return result;
  }

  void unFocus() {
    if (WidgetsBinding.instance.focusManager.primaryFocus?.hasFocus ?? false) {
      WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
    }
  }

  void hide() {
    unFocus();
    if (_isShowingDialog) {
      _isShowingDialog = false;
      sl.get<NavigatorService>().navigationKey.currentState?.pop();
    }
  }
}
