part of 'login_cubit.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccessState extends LoginState {
  LoginSuccessState({required this.authID});
  String authID;
}

final class ShowHidePasswordState extends LoginState {}

final class LoginFailState extends LoginState {
  LoginFailState({required this.message});
  String message;
}

final class LoginApiErrorState extends LoginState {
  LoginApiErrorState();
}
