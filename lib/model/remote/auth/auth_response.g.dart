// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponse _$AuthResponseFromJson(Map<String, dynamic> json) => AuthResponse(
  id: json['id'] as String,
  fullName: json['full_name'] as String,
  avatar: json['avatar'] as String,
  gender: (json['gender'] as num).toInt(),
  point: (json['point'] as num).toDouble(),
  birthday: json['birthday'] as String,
  phoneNumber: json['phone_number'] as String,
  address: json['address'] as String,
  fullAddress: json['full_address'] as String,
  email: json['email'] as String,
  city: json['city'] as String,
  district: json['district'] as String,
  ward: json['ward'] as String,
  token: json['token'] as String,
);

Map<String, dynamic> _$AuthResponseToJson(AuthResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'full_name': instance.fullName,
      'avatar': instance.avatar,
      'gender': instance.gender,
      'point': instance.point,
      'birthday': instance.birthday,
      'phone_number': instance.phoneNumber,
      'address': instance.address,
      'full_address': instance.fullAddress,
      'email': instance.email,
      'city': instance.city,
      'district': instance.district,
      'ward': instance.ward,
      'token': instance.token,
    };
