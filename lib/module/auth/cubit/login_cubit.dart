import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_coffee_app/cores/locator/locator.dart';
import 'package:flutter_coffee_app/cores/pref/store_service.dart';
import 'package:flutter_coffee_app/cores/repositories/auth_repository.dart';
import 'package:flutter_coffee_app/widget/loading.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this.authRepository) : super(LoginInitial()) {
    checkToken();
  }

  final AuthRepository authRepository;
  final pref = sl.get<StoreService>();

  Future<void> checkToken() async {
    final token = await pref.getToken(); // hoặc getAuthResponse()?.token
    if (token != null && token.isNotEmpty) {
      emit(LoginSuccessState(authID: token));
    }
  }

  // Hàm login hiện tại
  Future<void> callAPILogin(String phone_number, String password) async {
    sl.get<Loading>().show();
    try {
      final loginResponse = await authRepository.login(
        phone_number: phone_number,
        password: password,
      );

      if (loginResponse.token != null && loginResponse.token!.isNotEmpty) {
        await pref.saveAuthResponse(loginResponse);
        emit(LoginSuccessState(authID: loginResponse.token));
      } else {
        emit(LoginFailState(message: 'Lỗi đăng nhập hoặc sai mật khẩu'));
      }
    } catch (ex) {
      if (ex is DioException) {
        emit(
          LoginFailState(message: ex.message ?? 'Lỗi mạng hoặc server lỗi!'),
        );
      } else {
        emit(LoginFailState(message: 'Lỗi mạng hoặc server lỗi!'));
      }
    }
    sl.get<Loading>().hide();
  }

  void showHidePassword() {
    emit(ShowHidePasswordState());
  }


}
      