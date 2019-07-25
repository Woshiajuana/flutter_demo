
import 'package:json_annotation/json_annotation.dart';
import 'package:woosai_mall/models/goodsItem.modal.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'hotRecommend.model.g.dart';

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

