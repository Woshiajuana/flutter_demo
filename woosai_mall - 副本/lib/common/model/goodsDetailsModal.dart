
import 'package:json_annotation/json_annotation.dart';
import 'package:woosai_mall/common/model/goodsItemModal.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'goodsDetailsModal.g.dart';

// 这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class GoodsDetailsModal extends Object {

  GoodsDetailsModal(
      this.fileList,
      this.goodsInfo,
      this.customerPhone,
  );

  @JsonKey(name: 'fileList')
  List fileList;

  @JsonKey(name: 'goodsInfo')
  GoodsItemModal goodsInfo;

  @JsonKey(name: 'customerPhone')
  String customerPhone;

  //不同的类使用不同的mixin即可
  factory GoodsDetailsModal.fromJson(Map<String, dynamic> json) => _$GoodsDetailsModalFromJson(json);

  Map<String, dynamic> toJson() => _$GoodsDetailsModalToJson(this);

}
