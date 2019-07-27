
import 'package:woosai_mall/application.dart';
import 'package:woosai_mall/models/addressItem.model.dart';

class Address {

  static final Address _address = Address._internal();

  factory Address () {
    return _address;
  }

  Address._internal();

  // 获取地址列表
  Future reqAddressList () async {
    List<AddressItemModal> arrData = [];
    String url = Application.config.api.reqAddressList;
    List respBody = await Application.util.http.post(url);
    respBody.forEach((item) {
      arrData.add(AddressItemModal.fromJson(item));
    });
    return arrData;
  }

  // 添加地址
  Future doAddressAdd ({
    String contactName,
    String contactPhone,
    String contactAddress,
    String province,
    String city,
    String county,
  }) async {
    String url = Application.config.api.doAddressAdd;
    Map params = {
      'contactName': contactName,
      'contactPhone': contactPhone,
      'contactAddress': contactAddress,
      'province': province,
      'city': city,
      'county': county,
    };
    await Application.util.http.post(url, params: params);
  }

  // 修改地址
  Future doAddressUpdate ({
    String addressId,
    String contactName,
    String contactPhone,
    String contactAddress,
    String province,
    String city,
    String county,
  }) async {
    String url = Application.config.api.doAddressUpdate;
    Map params = {
      'addressId': addressId,
      'contactName': contactName,
      'contactPhone': contactPhone,
      'contactAddress': contactAddress,
      'province': province,
      'city': city,
      'county': county,
    };
    await Application.util.http.post(url, params: params);
  }

}