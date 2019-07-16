
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StoreUtil {

  static const String USER_INFO = 'USER_INFO';

  // 保存
  static save(String key, dynamic value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (value is Map) {
      value = json.encode(value);
    }
    sharedPreferences.setString(key, value.toString());
  }

  // 取出
  static get(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var value = sharedPreferences.get(key);
    try {
      value = json.decode(value);
    } catch (e) {
      print(e);
    }
    return value;
  }

  // 删除
  static remove(key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }
}