import 'package:flutter_coffee_app/model/remote/resource/home_response.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeError extends HomeState {
  final String error;
  HomeError({required this.error});
}

final class HomeLoaded extends HomeState {
  final String name;
  final List<BannerItem> banners;
  final int typeIndex;

  HomeLoaded({
    required this.name,
    required this.banners,
    required this.typeIndex,
  });
}
