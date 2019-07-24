
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:woosai_mall/application.dart';

class Http {

  static final Http _http = Http._internal();

  factory Http () {
    return _http;
  }

  Http._internal();

  static Dio _dio;
  static BaseOptions _options = new BaseOptions(
    baseUrl: Application.config.env.baseUrl,
    method: 'POST',
    connectTimeout: 1000 * 10,
    receiveTimeout: 1000 * 20,
  );

  static Future _init() async {
    _dio = new Dio(_options);
    _dio.interceptors
    .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      String accessTokenKey = Application.config.store.accessToken;
      String accessToken = await Application.util.store.get(accessTokenKey);
      if (accessToken != null) {
        options.headers = {
          'access-token': accessToken,
        };
      }
      return options;
    }, onResponse: (Response response) {
      Application.util.print.info('[${response.request.path}] 请求返回结果=> ${response.data}');
      var data = response.data;
      if (data == null) return _dio.reject(new DioError(response: response));
      var respCode = data['resp_code'] ?? data['respCode'];
      if (Application.config.env.arrSucCode.indexOf(respCode) == -1)
        return _dio.reject(new DioError(response: response));
      var respBody = data['data'] ?? data['result'];
      return respBody;
    }, onError: (DioError dioErr) {
      Application.util.print.info('[${dioErr?.response?.request?.path ?? ''}] 请求返回结果=> $dioErr');
      Response response = dioErr?.response;
      String respMessage = '网络繁忙，请稍后再试';
      if (dioErr.type == DioErrorType.RECEIVE_TIMEOUT
      || dioErr.type == DioErrorType.CONNECT_TIMEOUT) {
        respMessage = '网络超时，请稍后再试';
      } else if (response != null) {
        respMessage = response.data['resp_message'] ?? response.data['respMessage'] ?? '网络繁忙，请稍后再试';
      }
      throw Future.error('xxxxx');
    }));
  }

  Future get (String url, {Map<String, dynamic> params, Options options}) async {
    if (_dio == null) {
      await _init();
    }
    return await _dio.get(url, queryParameters: params, options: options);
  }

  Future post (String url, {Map<String, dynamic> params, Options options}) async {
//    if (_dio == null) {
      await _init();
//    }
    Application.util.print.info('[$url] 请求发起参数=> $params');
    return await _dio.post(url, data: params, options: options);
  }

  Future request (String url, {Map<String, dynamic> params, Options options}) async {
    if (_dio == null) {
      await _init();
    }
    return await _dio.request(url, data: params, options: options);
  }
}