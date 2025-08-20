import 'package:flutter_coffee_app/cores/network/api/home.api.dart';
import 'package:flutter_coffee_app/model/remote/resource/home_response.dart';

class HomeRepository {
  final HomeAPI api;
  HomeRepository(this.api);
  Future<HomeResponse> fetchBanners({
    required String cursor,
    int? type,
    int? limit,
  }) async {
    return await api.getBannerList(limit: limit, cursor: cursor, type: type);
  }
}
