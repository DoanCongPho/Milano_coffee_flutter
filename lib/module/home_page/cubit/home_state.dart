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
  final List<ProductItem> products;
  final List<Store> stores;
  final int typeIndex;
  final String cursorProduct;
  final String cursorStore;
  final String nearestStoreID;

  HomeLoaded({
    required this.name,
    required this.banners,
    required this.typeIndex,
    required this.products,
    required this.cursorProduct,
    required this.stores,
    required this.cursorStore,
    required this.nearestStoreID,
  });
}
