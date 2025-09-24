import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee_app/cores/locator/locator.dart';
import 'package:flutter_coffee_app/cores/services/navigation_service.dart';
import 'package:flutter_coffee_app/module/auth/cubit/login_cubit.dart';
import 'package:flutter_coffee_app/module/auth/profile_page.dart';
import 'package:flutter_coffee_app/router/routes.dart';
import 'package:provider/provider.dart';
import 'package:flutter_coffee_app/provider/google_signIn_provider.dart';
import 'package:flutter_coffee_app/provider/facebook_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final phoneController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    top: 0, // tuỳ chỉnh theo chiều cao ảnh logo nền
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: _buildLoginWithBackground(),
                  ),
                  Positioned(
                    top: 350, // tuỳ chỉnh theo chiều cao ảnh logo nền
                    left: 0,
                    right: 0,
                    bottom: 0,

                    child: Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(16),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              const SizedBox(height: 28),
                              _buildPhoneField(),
                              const SizedBox(height: 28),
                              _buildPasswordField(),
                              const SizedBox(height: 18),
                              _buildLoginButton(context),
                              const SizedBox(height: 5),
                              _buildForgotPasswordText(context),
                              const SizedBox(height: 28),
                              _buildDividerWithText(),
                              const SizedBox(height: 31),
                              _buildSocialLoginButtons(context),
                              const SizedBox(height: 26),
                              _buildRegisterText(context),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        listener: (BuildContext context, LoginState state) {
          if (state is LoginSuccessState) {
            FirebaseAnalytics.instance.logEvent(name: "login_success");
            sl.get<NavigatorService>().replace(Routes.mainPage);
          }
          if (state is LoginFailState) {
            print(state.message);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message), // <--- dùng message từ state
                backgroundColor: Colors.red,
              ),
            );
          }

          if (state is ShowHidePasswordState) {}
        },
      ),
    );
  }

  Widget _buildPhoneField() {
    return Center(
      child: Container(
        //áds color: Colors.red,
        height: 52,
        child: TextField(
          controller: phoneController,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.phone),
            hintText: 'Số điện thoại',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField() {
    return Center(
      child: SizedBox(
        height: 52,
        child: TextField(
          controller: passwordController,
          obscureText: true,
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.lock),
            hintText: 'Mật khẩu',
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(32)),
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 26),
      child: SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(32),
            ),
            elevation: 4,
            textStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          onPressed: () {
            final phone = phoneController.text.trim();
            final password = passwordController.text.trim();
            context.read<LoginCubit>().callAPILogin(phone, password);
          },
          child: Text('Đăng nhập'),
        ),
      ),
    );
  }

  Widget _buildForgotPasswordText(BuildContext context) {
    return Container(
      child: Align(
        alignment: Alignment.centerRight,
        child: TextButton(
          onPressed: () {},
          child: Text('Quên mật khẩu?', style: TextStyle(color: Colors.black)),
        ),
      ),
    );
  }

  Widget _buildDividerWithText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(child: Divider(thickness: 1)),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            "Hoặc đăng nhập bằng",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(child: Divider(thickness: 1)),
      ],
    );
  }

  Widget _buildSocialLoginButtons(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Image.asset("assets/images/facebook_img.png"),
            iconSize: 40,
            onPressed: () => throw Exception(),

            //    final fbProvider = context.read<FacebookSignInProvider>();
            // await fbProvider.facebookLogin();

            // if (FirebaseAuth.instance.currentUser != null) {
            //   Navigator.of(context).pushReplacement(
            //     MaterialPageRoute(builder: (_) => const ProfilePage()),
            //   );
            // }
          ),

          SizedBox(width: 20),
          IconButton(
            icon: Image.asset("assets/images/google_img.png"),
            iconSize: 40,
            onPressed: () async {
              final provider = context.read<GoogleSigninProvider>();
              await provider.googleLogin(); // chờ login xong

              final user = FirebaseAuth.instance.currentUser;
              if (user != null) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (_) => const ProfilePage()),
                );
              }
            },
          ),

          // Apple (only on iOS)
          if (Platform.isIOS)
            SizedBox(
              width: 50,
              height: 50,
              child: SignInWithAppleButton(
                style: SignInWithAppleButtonStyle.black, // or white
                onPressed: () async {
                  // TODO: implement Apple login logic
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildRegisterText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Bạn chưa có tài khoản?'),
        TextButton(
          onPressed: () {
            print('object');
          },
          child: Text(
            'Đăng ký',
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }

  Widget _buildLoginWithBackground() {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Image.asset(
          'assets/images/milano_background.png',
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),
        Positioned(
          top: 20,
          child: Image.asset('assets/images/milano_logo.png', width: 180),
        ),
      ],
    );
  }
}
