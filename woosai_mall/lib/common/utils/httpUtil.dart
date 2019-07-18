
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:woosai_mall/common/config/httpConfig.dart';
import 'package:woosai_mall/common/utils/printUtil.dart';
import 'package:woosai_mall/common/utils/storeUtil.dart';

class HttpUtil {

  static BaseOptions _options = new BaseOptions(
    method: 'POST',
    connectTimeout: 1000 * 10,
    receiveTimeout: 1000 * 20,
  );

  static Dio _dio = new Dio(_options);

  static request (String path, {
    data,
    Options options,
    CancelToken cancelToken,
  }) async {
    try {
      PrintUtil.info('[$path] 请求发起参数=> $data');
      if (options == null) {
        options = new Options();
      }
      options.headers['access-token'] = await getAccessToken();
      Response response = await _dio.request(path, data: data, cancelToken: cancelToken, options: options);
      PrintUtil.info('[$path] 请求返回结果=> $response');
      if (response.statusCode != HttpStatus.ok)
        throw('网络繁忙，请稍后再试');
      var respBody = response.data['data']??response.data['result'];
      var respCode = response.data['resp_code']??response.data['respCode'];
      var respMessage = response.data['resp_message']??response.data['respMessage'];
      if (HttpConfig.SUCCESS_CODE.indexOf(respCode) == -1)
        throw(respMessage);
      return respBody;
    } catch (err) {
      PrintUtil.err(err);
      return new Future.error(err);
    }
  }

  static getAccessToken () async {
    var userInfo = await StoreUtil.get(StoreUtil.USER_INFO);
    return userInfo == null ? '' : userInfo['access_token'] ?? '';
  }
}