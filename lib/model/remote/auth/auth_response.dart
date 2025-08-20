import 'package:json_annotation/json_annotation.dart';

part 'auth_response.g.dart';

@JsonSerializable()
class AuthResponse {
  final String id;
  @JsonKey(name: 'full_name')
  final String fullName;
  final String avatar;
  final int gender;
  final double point;
  final String birthday;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String address;
  @JsonKey(name: 'full_address')
  final String fullAddress;
  final String email;
  final String city;
  final String district;
  final String ward;
  final String token;

  AuthResponse({
    required this.id,
    required this.fullName,
    required this.avatar,
    required this.gender,
    required this.point,
    required this.birthday,
    required this.phoneNumber,
    required this.address,
    required this.fullAddress,
    required this.email,
    required this.city,
    required this.district,
    required this.ward,
    required this.token,
  });

  factory AuthResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AuthResponseToJson(this);
}
