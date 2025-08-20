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
