
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:woosai_mall/application.dart';

class User {

  static final User _user = User._internal();

  factory User () {
    return _user;
  }

  User._internal();

  Future doUserLogin ({ String phone, String password }) async {
    String url = Application.config.api.doUserLogin;
    Map<String, dynamic> params = {'phone': '13135621245', 'password': password};
    Options options = new Options(contentType: ContentType.parse('application/x-www-form-urlencoded'));
    var respBody = await Application.util.http.post(url, params: params, options: options);
    print('respBody => $respBody');
  }

}