// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goodsItem.modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsItemModal _$GoodsItemModalFromJson(Map<String, dynamic> json) {
  return GoodsItemModal(
      json['id'] as int,
      json['thumbnailPath'] as String,
      json['goodsName'] as String,
      json['goodsDetails'] as String,
      json['goodsPrice'] as int,
      json['goodsDiscountPrice'] as int,
      json['discountPoints'] as int,
      json['goodsBuyArea'] as String,
      json['goodsNorms'] as String,
      json['startTime'] as int,
      json['endTime'] as int,
      json['goodsStockNum'] as int);
}

Map<String, dynamic> _$GoodsItemModalToJson(GoodsItemModal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thumbnailPath': instance.thumbnailPath,
      'goodsName': instance.goodsName,
      'goodsDetails': instance.goodsDetails,
      'goodsPrice': instance.goodsPrice,
      'goodsDiscountPrice': instance.goodsDiscountPrice,
      'discountPoints': instance.discountPoints,
      'goodsBuyArea': instance.goodsBuyArea,
      'goodsNorms': instance.goodsNorms,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'goodsStockNum': instance.goodsStockNum
    };
