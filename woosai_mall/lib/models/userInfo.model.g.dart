// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'userInfo.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfo _$UserInfoFromJson(Map<String, dynamic> json) {
  return UserInfo(json['phone'] as String, json['userToken'] as String,
      json['access_token'] as String);
}

Map<String, dynamic> _$UserInfoToJson(UserInfo instance) => <String, dynamic>{
      'phone': instance.phone,
      'userToken': instance.userToken,
      'access_token': instance.accessToken
    };
