
import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'UserInfoModal.g.dart';

// 这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()

class UserInfoModal {
  UserInfoModal(
    this.phone,
    this.userToken,
  );

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'userToken')
  String userToken;

  //不同的类使用不同的mixin即可
  factory UserInfoModal.fromJson(Map<String, dynamic> json) => _$UserInfoModalFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoModalToJson(this);
}