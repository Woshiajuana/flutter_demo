// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userInfoModal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModal _$UserInfoModalFromJson(Map<String, dynamic> json) {
  return UserInfoModal(json['phone'] as String, json['userToken'] as String,
      json['access_token'] as String);
}

Map<String, dynamic> _$UserInfoModalToJson(UserInfoModal instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'userToken': instance.userToken,
      'access_token': instance.accessToken
    };
