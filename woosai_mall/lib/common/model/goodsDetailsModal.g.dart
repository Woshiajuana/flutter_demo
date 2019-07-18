// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goodsDetailsModal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsDetailsModal _$GoodsDetailsModalFromJson(Map<String, dynamic> json) {
  return GoodsDetailsModal(
      json['fileList'] as List,
      json['goodsInfo'] == null
          ? null
          : GoodsItemModal.fromJson(json['goodsInfo'] as Map<String, dynamic>),
      json['customerPhone'] as String);
}

Map<String, dynamic> _$GoodsDetailsModalToJson(GoodsDetailsModal instance) =>
    <String, dynamic>{
      'fileList': instance.fileList,
      'goodsInfo': instance.goodsInfo,
      'customerPhone': instance.customerPhone
    };
