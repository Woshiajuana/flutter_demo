
import 'package:woosai_mall/config/env.config.dart';
import 'package:woosai_mall/config/api.config.dart';
import 'package:woosai_mall/config/style.config.dart';
import 'package:woosai_mall/config/store.config.dart';

class Config {

  static final Config _config = Config._internal();

  factory Config () {
    return _config;
  }

  Config._internal();

  // 获取env
  Env get env {
    return new Env();
  }

  // 获取api
  Api get api {
    return new Api();
  }

  // 获取style
  Style get style {
    return new Style();
  }

  Store get store {
    return new Store();
  }

}
