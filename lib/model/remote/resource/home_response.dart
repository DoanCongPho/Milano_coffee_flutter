import 'package:json_annotation/json_annotation.dart';

part 'home_response.g.dart';

@JsonSerializable()
class HomeResponse {
  final String cursor;
  final List<BannerItem> data;

  HomeResponse({required this.cursor, required this.data});

  factory HomeResponse.fromJson(Map<String, dynamic> json) =>
      _$HomeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$HomeResponseToJson(this);
}

@JsonSerializable()
class ProductResponse {
  final String cursor;
  final List<ProductItem> data;

  ProductResponse({required this.cursor, required this.data});

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);
}

@JsonSerializable()
class BannerItem {
  final String id;
  @JsonKey(name: 'image')
  final String imageUrl;
  @JsonKey(name: 'link')
  final String redirectUrl;
  @JsonKey(name: 'name')
  final String title;

  BannerItem({
    required this.id,
    required this.imageUrl,
    required this.redirectUrl,
    required this.title,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) =>
      _$BannerItemFromJson(json);

  Map<String, dynamic> toJson() => _$BannerItemToJson(this);
}

@JsonSerializable()
class ProductItem {
  final String id;
  final String name;
  final String image;
  final int type;
  final int form;
  final double price;

  @JsonKey(name: 'category_id')
  final String categoryId;

  final int event;

  @JsonKey(name: 'price_discount')
  final double priceDiscount;

  ProductItem({
    required this.id,
    required this.name,
    required this.image,
    required this.type,
    required this.form,
    required this.price,
    required this.categoryId,
    required this.event,
    required this.priceDiscount,
  });

  factory ProductItem.fromJson(Map<String, dynamic> json) =>
      _$ProductItemFromJson(json);

  Map<String, dynamic> toJson() => _$ProductItemToJson(this);
}

@JsonSerializable()
class StoreRespone {
  final String cursor;
  final List<Store> data;

  StoreRespone({required this.cursor, required this.data});

  factory StoreRespone.fromJson(Map<String, dynamic> json) =>
      _$StoreResponeFromJson(json);

  Map<String, dynamic> toJson() => _$StoreResponeToJson(this);
}

@JsonSerializable()
class Store {
  final String id;
  final String name;
  final String address;
  final String distance;
  final double lat;
  final double lng;
  final String province;
  final String district;
  final String image;
  final DateTime start;
  final DateTime end;

  Store({
    required this.id,
    required this.name,
    required this.address,
    required this.distance,
    required this.lat,
    required this.lng,
    required this.province,
    required this.district,
    required this.image,
    required this.start,
    required this.end,
  });

  factory Store.fromJson(Map<String, dynamic> json) => _$StoreFromJson(json);
  Map<String, dynamic> toJson() => _$StoreToJson(this);
}
