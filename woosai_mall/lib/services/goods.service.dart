
import 'package:woosai_mall/application.dart';
import 'package:woosai_mall/models/hotRecommend.model.dart';
import 'package:woosai_mall/models/goodsList.modal.dart';

class Goods {

  static final Goods _goods = Goods._internal();

  factory Goods () {
    return _goods;
  }

  Goods._internal();

  // 获取首页商品
  Future reqHotAndRecommendGoods () async {
    String url = Application.config.api.reqReqHotRecommend;
    var respBody = await Application.util.http.post(url);
    HotRecommendModal hotRecommendModal = HotRecommendModal.fromJson(respBody);
    return hotRecommendModal;
  }

  // 获取列表商品
  Future reqGoodsList ({int pageSize = 10, int pageNum = 1}) async {
    String url = Application.config.api.reqGoodsList;
    Map params = {'pageSize': pageSize, 'pageNum': pageNum};
    var respBody = await Application.util.http.post(url, params: params);
    GoodsListModal goodsListModal = GoodsListModal.fromJson(respBody);
    return goodsListModal;
  }

}