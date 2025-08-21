// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
  cursor: json['cursor'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => BannerItem.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{'cursor': instance.cursor, 'data': instance.data};

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      cursor: json['cursor'] as String,
      data: (json['data'] as List<dynamic>)
          .map((e) => ProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{'cursor': instance.cursor, 'data': instance.data};

BannerItem _$BannerItemFromJson(Map<String, dynamic> json) => BannerItem(
  id: json['id'] as String,
  imageUrl: json['image'] as String,
  redirectUrl: json['link'] as String,
  title: json['name'] as String,
);

Map<String, dynamic> _$BannerItemToJson(BannerItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.imageUrl,
      'link': instance.redirectUrl,
      'name': instance.title,
    };

ProductItem _$ProductItemFromJson(Map<String, dynamic> json) => ProductItem(
  id: json['id'] as String,
  name: json['name'] as String,
  image: json['image'] as String,
  type: (json['type'] as num).toInt(),
  form: (json['form'] as num).toInt(),
  price: (json['price'] as num).toDouble(),
  categoryId: json['category_id'] as String,
  event: (json['event'] as num).toInt(),
  priceDiscount: (json['price_discount'] as num).toDouble(),
);

Map<String, dynamic> _$ProductItemToJson(ProductItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'type': instance.type,
      'form': instance.form,
      'price': instance.price,
      'category_id': instance.categoryId,
      'event': instance.event,
      'price_discount': instance.priceDiscount,
    };

StoreRespone _$StoreResponeFromJson(Map<String, dynamic> json) => StoreRespone(
  cursor: json['cursor'] as String,
  data: (json['data'] as List<dynamic>)
      .map((e) => Store.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$StoreResponeToJson(StoreRespone instance) =>
    <String, dynamic>{'cursor': instance.cursor, 'data': instance.data};

Store _$StoreFromJson(Map<String, dynamic> json) => Store(
  id: json['id'] as String,
  name: json['name'] as String,
  address: json['address'] as String,
  distance: json['distance'] as String,
  lat: (json['lat'] as num).toDouble(),
  lng: (json['lng'] as num).toDouble(),
  province: json['province'] as String,
  district: json['district'] as String,
  image: json['image'] as String,
  start: DateTime.parse(json['start'] as String),
  end: DateTime.parse(json['end'] as String),
);

Map<String, dynamic> _$StoreToJson(Store instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'address': instance.address,
  'distance': instance.distance,
  'lat': instance.lat,
  'lng': instance.lng,
  'province': instance.province,
  'district': instance.district,
  'image': instance.image,
  'start': instance.start.toIso8601String(),
  'end': instance.end.toIso8601String(),
};
