
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:woosai_mall/common/utils/httpUtil.dart';
import 'package:woosai_mall/common/config/httpConfig.dart';
import 'package:woosai_mall/common/model/userInfoModal.dart';

class ApiUtil {
  // 用户登录
  static userLogin(username, password) async {
    UserInfoModal userInfoModal;
    try {
      Map requestParams = {
        'phone': username,
        'password': password,
      };
      BaseOptions _options = new BaseOptions(contentType: ContentType.parse("application/x-www-form-urlencoded"));
      var respBody = await HttpUtil.request(HttpConfig.USER_LOGIN, data: requestParams, options: _options);
      userInfoModal = UserInfoModal.fromJson(respBody);
    } catch (err) {
      Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: err);
    }
    return userInfoModal;
  }

}