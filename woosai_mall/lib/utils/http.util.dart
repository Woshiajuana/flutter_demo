
import 'dart:io';
import 'package:dio/dio.dart';

class Http {

  static final Http _http = Http._internal();

  factory Http () {
    return _http;
  }

  Http._internal();

  static Dio _dio;
  static BaseOptions _options = new BaseOptions(
    method: 'POST',
    connectTimeout: 1000 * 10,
    receiveTimeout: 1000 * 20,
  );

  static Future _init() async {
    _dio = new Dio(_options);
    _dio.interceptors
    .add(InterceptorsWrapper(onRequest: (RequestOptions options) {

    }, onResponse: (Response response){

    }, onError: (DioError dioErr) {

    }));
  }

  Future get (String url, {Map<String, dynamic> params}) async {
    if (_dio == null) {
      await _init();
    }
    return await _dio.get(url, queryParameters: params);
  }

  Future post (String url, {Map<String, dynamic> params}) async {
    if (_dio == null) {
      await _init();
    }
    return await _dio.post(url, data: params);
  }

}