// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addressItem.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressItemModal _$AddressItemModalFromJson(Map<String, dynamic> json) {
  return AddressItemModal(
      json['id'] as int,
      json['contactName'] as String,
      json['contactPhone'] as String,
      json['city'] as String,
      json['county'] as String,
      json['province'] as String,
      json['contactAddress'] as String,
      json['isDefault'] as String);
}

Map<String, dynamic> _$AddressItemModalToJson(AddressItemModal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'contactName': instance.contactName,
      'contactPhone': instance.contactPhone,
      'city': instance.city,
      'county': instance.county,
      'province': instance.province,
      'contactAddress': instance.contactAddress,
      'isDefault': instance.isDefault
    };
