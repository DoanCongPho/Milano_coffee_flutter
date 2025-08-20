import 'package:dio/dio.dart';
import 'package:flutter_coffee_app/cores/network/interceptor/auth_interceptor.dart';

import 'package:native_dio_adapter/native_dio_adapter.dart';

class AppClient {
  static Dio buildDioClient(String baseUrl) {
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        // headers: headers,
      ),
    );

    dio.httpClientAdapter = NativeAdapter(
      createCupertinoConfiguration: () =>
          URLSessionConfiguration.ephemeralSessionConfiguration()
            ..cache = URLCache.withCapacity()
            ..timeoutIntervalForRequest = const Duration(seconds: 30),
      createCronetEngine: CronetEngine.build,
    );
    dio.interceptors.addAll([
      AuthInterceptor(),
      LogInterceptor(requestBody: true, responseBody: true),
    ]);

    return dio;
  }

  // static Map<String, dynamic> get headers => _mapToHeaders;

  // static final Map<String, dynamic> _mapToHeaders = {
  //   'Content-type': 'application/json; charset=UTF-8',
  //   'Accept': 'application/json',
  //   'x-api-key':
  //       '3EB76D87D97C427943957C555AB0B60847582D38CB1688ED86C59251206305E3',
  //   'x-request-id': '123', // Có thể cập nhật runtime nếu cần
  //   'Accept-Language': 'vi',
  //   'Authorization': 'Bearer 123', // Cũng nên cập nhật runtime nếu có login
  // };
}
