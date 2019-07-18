
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:woosai_mall/common/utils/httpUtil.dart';
import 'package:woosai_mall/common/utils/printUtil.dart';
import 'package:woosai_mall/common/config/httpConfig.dart';

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
    var respBody;
    try {
      respBody = await HttpUtil.request(HttpConfig.REQ_HOT_RECOMMEND);
    } catch (err) {
      PrintUtil.err(err);
      Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: err.toString());
    }
    return respBody;
  }

}