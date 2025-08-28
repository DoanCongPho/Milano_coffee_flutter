import 'package:flutter/material.dart';
import 'package:flutter_coffee_app/module/auth/cubit/custom_button.dart';
import 'package:flutter_coffee_app/module/home_page/cubit/home_cubit.dart';
import 'package:flutter_coffee_app/module/home_page/cubit/home_state.dart';
import 'package:flutter_coffee_app/module/news_page/news_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_coffee_app/widget/auto_expanded_list.dart';
import 'package:flutter_coffee_app/widget/beverages.dart';
import 'package:flutter_coffee_app/widget/home_carousel.dart';
import 'package:flutter_coffee_app/widget/home_header.dart';
import 'package:flutter_coffee_app/widget/store_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            if (state is HomeLoaded) {
              return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Column(
                  children: [
                    HomeHeader(),
                    AutoExpandedList(
                      children: [
                        MyCarousel(
                          images: [
                            'assets/images/coffee_img_1.png',
                            'assets/images/coffee_img_2.png',
                            'assets/images/coffee_img_3.png',
                          ],
                        ),
                        Image.asset(
                          "assets/images/banner2.png",
                          height: 165,
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NewsDetailPage(),
                              ),
                            );
                          },
                          child: Image.asset(
                            "assets/images/banner3.png",
                            height: 200,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Image.asset("assets/images/banner4.png"),
                        Image.asset("assets/images/banner5.png"),
                        ...state.banners.map((banner) {
                          return Image.network(
                            banner.imageUrl,
                            height: 165,
                            fit: BoxFit.fill,
                            alignment: Alignment.topCenter,
                          );
                        }).toList(),
                        CustomButton(
                          text: 'Xem thêm',
                          onPressed: () {
                            context.read<HomeCubit>().loadBanner();
                          },
                        ),
                        StoreSection(),
                        CustomButton(
                          text: 'Xem thêm',
                          onPressed: () {
                            context.read<HomeCubit>().loadStore();
                          },
                        ),
                        // ProductSelectionContent(),
                        ProductList(),
                        CustomButton(
                          text: 'Xem thêm',
                          onPressed: () {
                            context.read<HomeCubit>().loadProduct();
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              );
            } else {
              // Loading hoặc chưa có dữ liệu
              return const Center(child: CircularProgressIndicator());
            }
          },
        ),
      ),
    );
  }
}
