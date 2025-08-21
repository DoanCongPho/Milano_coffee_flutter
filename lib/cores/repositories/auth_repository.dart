import 'package:flutter_coffee_app/cores/network/api/auth.api.dart';
import 'package:flutter_coffee_app/model/remote/auth/auth_response.dart';
import 'package:flutter_coffee_app/model/remote/auth/refresh_token_response.dart';

// abstract class use for unit test and implement
abstract class AuthRepository {
  Future<AuthResponse> login({
    required String phone_number,
    required String password,
  });

  // Future<VerifyAuthResponse> verifyAuth({
  //   required String authID,
  //   required String otp,
  // });

  Future<RefreshTokenResponse> refreshToken({
    required String username,
    required String refreshToken,
  });
}

class AuthRepositoryImp implements AuthRepository {
  const AuthRepositoryImp({required this.authService});

  final AuthAPI authService;

  @override
  Future<AuthResponse> login({
    required String phone_number,
    required String password,
  }) {
    return authService.login({
      'phone_number': phone_number,
      'password': password,
    });
  }

  @override
  Future<RefreshTokenResponse> refreshToken({
    required String username,
    required String refreshToken,
  }) {
    return authService.refreshToken({
      'userName': username,
      'refreshToken': refreshToken,
    });
  }
}
