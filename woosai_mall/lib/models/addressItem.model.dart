
import 'package:json_annotation/json_annotation.dart';

// user.g.dart 将在我们运行生成命令后自动生成
part 'addressItem.model.g.dart';

// 这个标注是告诉生成器，这个类是需要生成Model类的
@JsonSerializable()
class AddressItemModal extends Object {

  AddressItemModal(
      this.id,
      this.contactName,
      this.contactPhone,
      this.city,
      this.county,
      this.province,
      this.contactAddress,
      this.isDefault,
  );

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'contactName')
  String contactName;

  @JsonKey(name: 'contactPhone')
  String contactPhone;

  @JsonKey(name: 'city')
  String city;

  @JsonKey(name: 'county')
  String county;

  @JsonKey(name: 'province')
  String province;

  @JsonKey(name: 'contactAddress')
  String contactAddress;

  @JsonKey(name: 'isDefault')
  String isDefault;


  //不同的类使用不同的mixin即可
  factory AddressItemModal.fromJson(Map<String, dynamic> json) => _$AddressItemModalFromJson(json);

  Map<String, dynamic> toJson() => _$AddressItemModalToJson(this);

}
