
import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'goodsItemModal.g.dart';

@JsonSerializable()
class GoodsItemModal extends Object {

  GoodsItemModal(
      this.id,
      this.thumbnailPath,
      this.goodsName,
      this.goodsDetails,
      this.goodsPrice,
      this.goodsDiscountPrice,
      this.discountPoints,
      this.goodsBuyArea,
      this.startTime,
      this.endTime,
      this.goodsStockNum,
  );

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'thumbnailPath')
  String thumbnailPath;

  @JsonKey(name: 'goodsName')
  String goodsName;

  @JsonKey(name: 'goodsDetails')
  String goodsDetails;

  @JsonKey(name: 'goodsPrice')
  int goodsPrice;

  @JsonKey(name: 'goodsDiscountPrice')
  int goodsDiscountPrice;

  @JsonKey(name: 'discountPoints')
  int discountPoints;

  @JsonKey(name: 'goodsBuyArea')
  String goodsBuyArea;

  @JsonKey(name: 'startTime')
  int startTime;

  @JsonKey(name: 'endTime')
  int endTime;

  @JsonKey(name: 'goodsStockNum')
  int goodsStockNum;

  //不同的类使用不同的mixin即可
  factory GoodsItemModal.fromJson(Map<String, dynamic> json) => _$GoodsItemModalFromJson(json);

  Map<String, dynamic> toJson() => _$GoodsItemModalToJson(this);

}