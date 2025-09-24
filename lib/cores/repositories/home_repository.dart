import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_coffee_app/cores/network/api/home.api.dart';
import 'package:flutter_coffee_app/model/remote/resource/home_response.dart';

class HomeRepository {
  final HomeAPI api;
  final useFirestore;
  HomeRepository(this.api, {this.useFirestore = false});

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
    if (useFirestore) {
      final snap = await FirebaseFirestore.instance.collection('Drink').get();
      final products = snap.docs.map((doc) {
        return ProductItem.fromJson({'id': doc.id, ...doc.data()});
      }).toList();

      return ProductResponse(cursor: '', data: products);
    }
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
