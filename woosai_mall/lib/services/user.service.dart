
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:redux/redux.dart';
import 'package:woosai_mall/application.dart';
import 'package:woosai_mall/common/redux/userRedux.dart';
import 'package:woosai_mall/models/userInfo.model.dart';

class User {

  static final User _user = User._internal();

  factory User () {
    return _user;
  }

  User._internal();

  Future doUserLogin ({ String phone, String password }) async {
    String url = Application.config.api.doUserLogin;
    Map<String, dynamic> params = {'phone': phone, 'password': password};
    Options options = new Options(contentType: ContentType.parse('application/x-www-form-urlencoded'));
    var respBody = await Application.util.http.post(url, params: params, options: options);
    url = Application.config.api.doAuthLogin;
    String platformNo = Application.config.env.platformNo;
    params = {'platformNo': platformNo, 'pfUserToken': respBody['userToken']};
    var respBody2 = await Application.util.http.post(url, params: params);
    respBody['access_token'] = respBody2['access_token'];
    return respBody;
  }

  Future updateUserAction (Store store) async {

  }

}