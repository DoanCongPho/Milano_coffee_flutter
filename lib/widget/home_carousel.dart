import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CarouselCubit extends Cubit<int> {
  CarouselCubit() : super(0);

  void updateIndex(int index) => emit(index);
}

class MyCarousel extends StatelessWidget {
  final List<String> images;

  const MyCarousel({super.key, required this.images});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CarouselCubit(),
      child: BlocBuilder<CarouselCubit, int>(
        builder: (context, currentIndex) {
          return Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  height: 403,
                  enlargeCenterPage: true,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 2),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  viewportFraction: 0.98,
                  aspectRatio: 2.0,
                  initialPage: 0,
                  onPageChanged: (index, reason) {
                    context.read<CarouselCubit>().updateIndex(index);
                  },
                ),
                items: images.map((item) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      item,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: images.asMap().entries.map((entry) {
                  return Container(
                    width: 8.0,
                    height: 8.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: currentIndex == entry.key
                          ? Colors.black
                          : Colors.grey.withOpacity(0.4),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
