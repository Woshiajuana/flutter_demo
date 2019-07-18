// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotRecommendModal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotRecommendModal _$HotRecommendModalFromJson(Map<String, dynamic> json) {
  return HotRecommendModal(
      (json['hotGoodsInfoList'] as List)
          ?.map((e) => e == null
              ? null
              : GoodsItemModal.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['recomGoodsInfoList'] as List)
          ?.map((e) => e == null
              ? null
              : GoodsItemModal.fromJson(e as Map<String, dynamic>))
          ?.toList(),
      (json['goodsInfoList'] as List)
          ?.map((e) => e == null
              ? null
              : GoodsItemModal.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$HotRecommendModalToJson(HotRecommendModal instance) =>
    <String, dynamic>{
      'hotGoodsInfoList': instance.hotGoodsInfoList,
      'recomGoodsInfoList': instance.recomGoodsInfoList,
      'goodsInfoList': instance.goodsInfoList
    };

GoodsItemModal _$GoodsItemModalFromJson(Map<String, dynamic> json) {
  return GoodsItemModal(
      json['id'] as String,
      json['thumbnailPath'] as String,
      json['goodsName'] as String,
      json['goodsDetails'] as String,
      json['goodsPrice'] as String,
      json['goodsDiscountPrice'] as String,
      json['discountPoints'] as String);
}

Map<String, dynamic> _$GoodsItemModalToJson(GoodsItemModal instance) =>
    <String, dynamic>{
      'id': instance.id,
      'thumbnailPath': instance.thumbnailPath,
      'goodsName': instance.goodsName,
      'goodsDetails': instance.goodsDetails,
      'goodsPrice': instance.goodsPrice,
      'goodsDiscountPrice': instance.goodsDiscountPrice,
      'discountPoints': instance.discountPoints
    };
