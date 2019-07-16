
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
        return new Future.error(new DioError(
          response: response,
          message: "statusCode: $response.statusCode, service error",
          type: DioErrorType.RESPONSE,
        ));

      print(response.statusCode);
//      var code = response['resp_code'] ||
//      if (HttpConfig.SUCCESS_CODE.indexOf(response.statusCode) > -1)
    } catch (e) {
      return new Future.error(new DioError(
        response: response,
        message: "data parsing exception...",
        type: DioErrorType.RESPONSE,
      ));
    }
  }

}