import 'package:flutter_coffee_app/cores/network/api/home.api.dart';
import 'package:flutter_coffee_app/model/remote/resource/home_response.dart';

class HomeRepository {
  final HomeAPI api;
  HomeRepository(this.api);

  // Fetch banners
  Future<HomeResponse> fetchBanners({
    required String cursor,
    int? type,
    int? limit,
  }) async {
    return await api.getBannerList(limit: limit, cursor: cursor, type: type);
  }

  // Fetch products
  Future<ProductResponse> fetchProducts({
    required String cursor,
    required String store,
    required int limit,
  }) async {
    return await api.getProductList(cursor: cursor, limit: limit, store: store);
  }

  Future<StoreRespone> fetchStores({
    required String cursor,
    required int limit,
    required double lat,
    required double lng,
  }) async {
    return await api.getStoreList(
      cursor: cursor,
      limit: limit,
      lat: lat,
      lng: lng,
    );
  }
}
