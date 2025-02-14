import 'package:flutter/material.dart';

class RouteUtil {
  /// 初始化
  static const initialRoute = home;

  /// 首页
  static const home = 'home';

  /// 手写签名
  static const signature = 'signature';

  /// 十字架布局
  static const crossFlow = 'crossFlow';

  /// 路由生成器
  static RouteFactory onGenerateRoute = (settings) {
    return null;
  };
}
