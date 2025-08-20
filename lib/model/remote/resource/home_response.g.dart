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
