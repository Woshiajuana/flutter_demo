// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderItem.modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderItemModal _$OrderItemModalFromJson(Map<String, dynamic> json) {
  return OrderItemModal(
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
      json['goodsStockNum'] as int)
    ..tradeAmt = json['tradeAmt'] as int
    ..orderNo = json['orderNo'] as int
    ..orderStatus = json['orderStatus'] as String;
}

Map<String, dynamic> _$OrderItemModalToJson(OrderItemModal instance) =>
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
      'goodsStockNum': instance.goodsStockNum,
      'tradeAmt': instance.tradeAmt,
      'orderNo': instance.orderNo,
      'orderStatus': instance.orderStatus
    };
