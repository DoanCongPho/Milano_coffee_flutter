import 'package:dio/dio.dart';

import 'package:flutter_coffee_app/cores/pref/pref_key.dart';

import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final prefs = await SharedPreferences.getInstance();
    final authKey = prefs.getString(PrefKey.token);

    // Set Authorization Header
    if (authKey != null && authKey.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $authKey';
    }
    
    // Add all required headers
    options.headers.addAll({
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'x-api-key':
          '3EB76D87D97C427943957C555AB0B60847582D38CB1688ED86C59251206305E3',
      'x-request-id': '123',
      'Accept-Language': 'vi',
    });

    return handler.next(options);
  }
}
