
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:woosai_mall/common/utils/httpUtil.dart';
import 'package:woosai_mall/common/utils/printUtil.dart';
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
      Options _options = new Options(contentType: ContentType.parse('application/x-www-form-urlencoded'));
      var respBody = await HttpUtil.request(HttpConfig.USER_LOGIN, data: requestParams, options: _options);
      PrintUtil.info(respBody);
      userInfoModal = UserInfoModal.fromJson(respBody);
    } catch (err) {
      PrintUtil.err(err);
      Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: err.toString());
    }
    return userInfoModal;
  }

}