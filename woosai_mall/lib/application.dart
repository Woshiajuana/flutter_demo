
import 'package:flutter/material.dart';
import 'package:woosai_mall/config/config.dart';
import 'package:woosai_mall/router/router.dart';
import 'package:woosai_mall/utils/util.dart';

class Application {

  // 获取配置
  static Config get config {
    return new Config();
  }

  // 获取路由
  static Router get router {
    return new Router();
  }

  // 获取工具
  static Util get util{
    return new Util();
  }


}