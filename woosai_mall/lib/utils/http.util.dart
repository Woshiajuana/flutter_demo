
import 'dart:io';
import 'package:dio/dio.dart';

class Http {

  static final Http _http = Http._internal();

  factory Http () {
    return _http;
  }

  Http._internal();

  static Dio _dio;

  static Future _init() async {
    _dio = await SharedPreferences.getInstance();
  }


}