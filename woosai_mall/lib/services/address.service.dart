
import 'package:woosai_mall/application.dart';
import 'package:woosai_mall/models/hotRecommend.model.dart';
import 'package:woosai_mall/models/addressItem.model.dart';

class Address {

  static final Address _address = Address._internal();

  factory Address () {
    return _address;
  }

  Address._internal();

  // 获取地址列表
  Future reqHotAndRecommendGoods () async {
    String url = Application.config.api.reqReqHotRecommend;
    var respBody = await Application.util.http.post(url);
    HotRecommendModal hotRecommendModal = HotRecommendModal.fromJson(respBody);
    return hotRecommendModal;
  }

}