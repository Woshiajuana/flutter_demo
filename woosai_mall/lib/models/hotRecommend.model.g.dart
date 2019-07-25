// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotRecommend.model.dart';

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
