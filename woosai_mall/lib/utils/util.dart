
import 'package:woosai_mall/utils/print.util.dart';
import 'package:woosai_mall/utils/http.util.dart';

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


}