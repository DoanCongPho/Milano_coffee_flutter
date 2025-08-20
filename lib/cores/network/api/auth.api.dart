import 'package:dio/dio.dart';
import 'package:flutter_coffee_app/model/remote/auth/auth_response.dart';
import 'package:flutter_coffee_app/model/remote/auth/refresh_token_response.dart';
import 'package:retrofit/retrofit.dart';

part 'auth.api.g.dart';

@RestApi()
abstract class AuthAPI {
  factory AuthAPI(Dio dio) = _AuthAPI;

  @POST("user-service/api/customer/login")
  Future<AuthResponse> login(@Body() Map<String, dynamic> body);

  @POST('refresh')
  Future<RefreshTokenResponse> refreshToken(@Body() Map<String, dynamic> body);

  @POST('updateToken')
  Future<RefreshTokenResponse> updateToken(@Body() Map<String, dynamic> body);
}
