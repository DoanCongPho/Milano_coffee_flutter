import 'package:flutter/material.dart';

class NavigatorService {
  String? _deepLinkValue;
  bool _isDataTrafficShowing = false;
  final _navigationKey = GlobalKey<NavigatorState>();
  GlobalKey<NavigatorState> get navigationKey => _navigationKey;

  Future<dynamic> push(String name, {dynamic args}) async {
    return Navigator.pushNamed(
      _navigationKey.currentState!.context,
      name,
      arguments: args,
    );
  }

  Future<dynamic> replace(String name, {dynamic args}) async {
    return Navigator.pushReplacementNamed(
      _navigationKey.currentState!.context,
      name,
      arguments: args,
    );
  }

  Future<dynamic> pushAndRemoveUtil(
    String name, {
    bool Function(Route<dynamic>)? predicate,
    dynamic args,
  }) {
    return Navigator.pushNamedAndRemoveUntil(
      _navigationKey.currentState!.context,
      name,
      predicate ?? (route) => false,
      arguments: args,
    );
  }

  void popUntil(bool Function(Route<dynamic> route) predicate) {
    Navigator.popUntil(_navigationKey.currentState!.context, predicate);
  }

  void pop(BuildContext context, {dynamic args}) {
    Navigator.pop(context, args);
  }

  void setDataTrafficShowing(bool showing) {
    _isDataTrafficShowing = showing;
  }

  bool get dataTrafficShowing => _isDataTrafficShowing;

  void setDeepLinkValued(String? deepLinkValue) {
    _deepLinkValue = deepLinkValue;
  }

  String? get deepLinkValue => _deepLinkValue;
}
