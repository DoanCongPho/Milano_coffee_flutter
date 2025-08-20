import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/module/main_page/cubit/main_cubit.dart';
import 'package:flutter_coffee_app/module/home_page/home_page.dart';
import 'package:flutter_coffee_app/module/Qr/qr_page.dart';
import 'package:flutter_coffee_app/module/other/update_profile_page.dart';
import 'package:flutter_coffee_app/module/Order/order_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee_app/module/voucher/voucher_page.dart';

class MainPage extends StatelessWidget {
  final List<Widget> _screens = [
    HomePage(),
    OrderPage(),
    QRPage(),
    VoucherPage(),
    UpdateProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationCubit, int>(
      builder: (context, selectedIndex) {
        return Scaffold(
          body: _screens[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: Colors.black,
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.white,
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedIndex,
            onTap: (index) =>
                context.read<NavigationCubit>().updateIndex(index),
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Trang Chủ',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.shopping_cart),
                label: 'Đặt Món',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner),
                label: 'QR',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.card_giftcard),
                label: 'Voucher',
              ),
              BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Khác'),
            ],
          ),
        );
      },
    );
  }
}
