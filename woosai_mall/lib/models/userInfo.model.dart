
import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'userInfo.model.g.dart';

// 这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()

class UserInfo {
  UserInfo(
      this.phone,
      this.userToken,
      this.accessToken,
      );

  @JsonKey(name: 'phone')
  String phone;

  @JsonKey(name: 'userToken')
  String userToken;

  @JsonKey(name: 'access_token')
  String accessToken;

  //不同的类使用不同的mixin即可
  factory UserInfo.fromJson(Map<String, dynamic> json) => _$UserInfoFromJson(json);

  Map<String, dynamic> toJson() => _$UserInfoToJson(this);

  // 命名构造函数
  UserInfo.empty();
}