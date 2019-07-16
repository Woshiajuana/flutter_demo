//import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

class HttpUtil {

  static BaseOptions _options = new BaseOptions(
//    baseUrl: "https://www.xx.com/api",
    contentType: ContentType.parse("application/x-www-form-urlencoded"),
    connectTimeout: 1000 * 10,
    receiveTimeout: 1000 * 20,
  );

  static Dio _dio = new Dio(_options);

  static request (String path, {
    data,
    BaseOptions options,
    CancelToken cancelToken,
  }) async {
    try {
      print('paht=>$path');
      print('data=>$data');
      Response response = await _dio.request(path, data: data, cancelToken: cancelToken);
      print(response);
    } catch (e) {
      print(e);
    }
  }

}