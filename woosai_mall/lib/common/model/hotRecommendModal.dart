
import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'hotRecommendModal.g.dart';

// 这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class HotRecommendModal extends Object {

  HotRecommendModal(
      this.hotGoodsInfoList,
      this.recomGoodsInfoList,
      this.goodsInfoList,
  );

  @JsonKey(name: 'hotGoodsInfoList')
  List<GoodsItemModal> hotGoodsInfoList;

  @JsonKey(name: 'recomGoodsInfoList')
  List<GoodsItemModal> recomGoodsInfoList;

  @JsonKey(name: 'goodsInfoList')
  List<GoodsItemModal> goodsInfoList;

  //不同的类使用不同的mixin即可
  factory HotRecommendModal.fromJson(Map<String, dynamic> json) => _$HotRecommendModalFromJson(json);

  Map<String, dynamic> toJson() => _$HotRecommendModalToJson(this);

}

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


  //不同的类使用不同的mixin即可
  factory GoodsItemModal.fromJson(Map<String, dynamic> json) => _$GoodsItemModalFromJson(json);

  Map<String, dynamic> toJson() => _$GoodsItemModalToJson(this);

}