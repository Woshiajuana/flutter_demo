
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

  // 修改地址
  Future doAddressDelete ({
    String addressId,
  }) async {
    String url = Application.config.api.doAddressDelete;
    Map params = {'addressId': addressId};
    await Application.util.http.post(url, params: params);
  }

  // 设为默认地址
  Future doAddressSetDefault ({
    String addressId,
  }) async {
    String url = Application.config.api.doAddressSetDefault;
    Map params = {'addressId': addressId};
    await Application.util.http.post(url, params: params);
  }

  // 查询信息
  Future reqAddressDetails ({
    String addressId,
  }) async {
    String url = Application.config.api.reqAddressDetails;
    Map params = {'addressId': addressId};
    var respBody = await Application.util.http.post(url, params: params);
    AddressItemModal addressItemModal = AddressItemModal.fromJson(respBody);
    return addressItemModal;
  }

}