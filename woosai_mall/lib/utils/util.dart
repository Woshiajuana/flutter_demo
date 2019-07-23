
import 'package:woosai_mall/utils/print.util.dart';
import 'package:woosai_mall/utils/http.util.dart';
import 'package:woosai_mall/utils/store.util.dart';

class Util {

  static final Util _util = Util._internal();

  factory Util () {
    return _util;
  }

  Util._internal();

  // 获取控制台输出
  Print get print {
    return new Print();
  }

  // 获取http网络
  Http get http {
    return new Http();
  }

  // 获取存储工具
  Store get store {
    return new Store();
  }

}