// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'orderList.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderListModal _$OrderListModalFromJson(Map<String, dynamic> json) {
  return OrderListModal(
      json['lastPage'] as int,
      (json['list'] as List)
          ?.map((e) => e == null
              ? null
              : OrderItemModal.fromJson(e as Map<String, dynamic>))
          ?.toList());
}

Map<String, dynamic> _$OrderListModalToJson(OrderListModal instance) =>
    <String, dynamic>{'lastPage': instance.lastPage, 'list': instance.list};
