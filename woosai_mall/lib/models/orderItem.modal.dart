
import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'orderItem.modal.g.dart';

@JsonSerializable()
class OrderItemModal extends Object {

  OrderItemModal(
      this.id,
      this.thumbnailPath,
      this.goodsName,
      this.goodsDetails,
      this.goodsPrice,
      this.goodsDiscountPrice,
      this.discountPoints,
      this.goodsBuyArea,
      this.goodsNorms,
      this.startTime,
      this.endTime,
      this.goodsStockNum,
      this.tradeBuyNum,
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

  @JsonKey(name: 'goodsNorms')
  String goodsNorms;

  @JsonKey(name: 'startTime')
  int startTime;

  @JsonKey(name: 'endTime')
  int endTime;

  @JsonKey(name: 'goodsStockNum')
  int goodsStockNum;

  @JsonKey(name: 'tradeAmt')
  int tradeAmt;

  @JsonKey(name: 'orderNo')
  String orderNo;

  @JsonKey(name: 'orderStatus')
  String orderStatus;

  @JsonKey(name: 'tradeBuyNum')
  int tradeBuyNum;

  //不同的类使用不同的mixin即可
  factory OrderItemModal.fromJson(Map<String, dynamic> json) => _$OrderItemModalFromJson(json);

  Map<String, dynamic> toJson() => _$OrderItemModalToJson(this);

}