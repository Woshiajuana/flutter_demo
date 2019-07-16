
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:woosai_mall/common/config/httpConfig.dart';

class HttpUtil {

  static BaseOptions _options = new BaseOptions(
    method: 'POST',
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
    Response response = await _dio.request(path, data: data, cancelToken: cancelToken);
    try {
      print('paht=> $path');
      print('data=> $data');
      print('response=> $response');
      if (response.statusCode != HttpStatus.ok)
        throw('网络繁忙，请稍后再试');
      var respBody = response.data['data'];
      var respCode = response.data['resp_code'];
      var respMessage = response.data['resp_message'];
      print('respBody=> $respBody');
      print('respCode=> $respCode');
      print('respMessage=> $respMessage');
      if (HttpConfig.SUCCESS_CODE.indexOf(respCode) == -1)
        throw(respMessage);
      return respBody;
    } catch (err) {
      return new Future.error(err);
    }
  }

}