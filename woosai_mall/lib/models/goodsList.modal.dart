
import 'package:json_annotation/json_annotation.dart';
import 'package:woosai_mall/models/goodsItem.modal.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'goodsList.modal.g.dart';

// 这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class GoodsListModal extends Object {

  GoodsListModal(
    this.lastPage,
    this.list,
  );

  @JsonKey(name: 'lastPage')
  int lastPage;

  @JsonKey(name: 'list')
  List<GoodsItemModal> list;

  //不同的类使用不同的mixin即可
  factory GoodsListModal.fromJson(Map<String, dynamic> json) => _$GoodsListModalFromJson(json);

  Map<String, dynamic> toJson() => _$GoodsListModalToJson(this);

}

