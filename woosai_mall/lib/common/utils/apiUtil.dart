
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:woosai_mall/common/utils/httpUtil.dart';
import 'package:woosai_mall/common/utils/printUtil.dart';
import 'package:woosai_mall/common/config/httpConfig.dart';
import 'package:woosai_mall/common/model/hotRecommendModal.dart';
import 'package:woosai_mall/common/model/goodsDetailsModal.dart';

class ApiUtil {

  // 用户登录
  static userLogin(username, password) async {
    var respBody;
    try {
      Map params = {
        'phone': username,
        'password': password,
      };
      Options _options = new Options(contentType: ContentType.parse('application/x-www-form-urlencoded'));
      respBody = await HttpUtil.request(HttpConfig.USER_LOGIN, data: params, options: _options);
      Map params2 = {
        'platformNo': HttpConfig.PLATFORM_NO,
        'pfUserToken': respBody['userToken'],
      };
      var respBody2 = await HttpUtil.request(HttpConfig.DO_AUTH_LOGIN, data: params2);
      respBody['access_token'] = respBody2['access_token'];
    } catch (err) {
      PrintUtil.err(err);
      Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: err.toString());
    }
    return respBody;
  }

  // 首页数据
  static reqHotAndRecommendGoods () async {
    HotRecommendModal hotRecommendModal;
    try {
      var respBody = await HttpUtil.request(HttpConfig.REQ_HOT_RECOMMEND);
      hotRecommendModal = HotRecommendModal.fromJson(respBody);
    } catch (err) {
      PrintUtil.err(err);
      Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: err.toString());
    }
    return hotRecommendModal;
  }

  // 商品详情页数据
  static reqGoodsDetails (goodsId) async {
    GoodsDetailsModal goodsDetailsModal;
    Map params = {
      'goodsId': goodsId,
    };
    try {
      var respBody = await HttpUtil.request(HttpConfig.REQ_GOODS_DETAILS, data: params);
      goodsDetailsModal = GoodsDetailsModal.fromJson(respBody);
    } catch (err) {
      PrintUtil.err(err);
      Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: err.toString());
    }
    return goodsDetailsModal;

  }

}