import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class StorageUtil {
  StorageUtil._();
  static final StorageUtil _instance = StorageUtil._();
  factory StorageUtil() => _instance;

  late SharedPreferences _sp;
  Future<void> ensureInitialized() async {
    _sp = await SharedPreferences.getInstance();
  }

  /// 设置
  Future<void> setItem(String key, dynamic value) async {
    await _sp.setString(key, jsonEncode(value));
  }

  /// 获取
  dynamic getItem(String key) {
    var value = _sp.get(key);

    try {
      value = jsonDecode(value.toString());
    } catch (_) {}

    return value;
  }

  /// 删除
  Future<bool> removeItem(String key) async {
    return _sp.remove(key);
  }

  /// 清空
  Future<bool> clear() async {
    return _sp.clear();
  }
}
