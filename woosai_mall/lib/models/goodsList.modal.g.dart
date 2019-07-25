// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'goodsList.modal.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GoodsListModal _$GoodsListModalFromJson(Map<String, dynamic> json) {
  return GoodsListModal(
      json['lastPage'] as int,
      (json['list'] as List)
          ?.map((e) => e == null
              ? null
              : GoodsItemModal.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$GoodsListModalToJson(GoodsListModal instance) =>
    <String, dynamic>{'lastPage': instance.lastPage, 'list': instance.list};
