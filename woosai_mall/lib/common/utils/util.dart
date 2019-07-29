
import 'package:woosai_mall/common/utils/print.util.dart';
import 'package:woosai_mall/common/utils/http.util.dart';
import 'package:woosai_mall/common/utils/store.util.dart';
import 'package:woosai_mall/common/utils/verify.util.dart';
import 'package:woosai_mall/common/utils/modal.util.dart';
import 'package:woosai_mall/common/utils/loading.util.dart';

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

  // 参数验证工具
  Verify get verify {
    return new Verify();
  }

  // 弹窗提示工具
  Modal get modal {
    return new Modal();
  }

  // loading 工具
  Loading get loading {
    return new Loading();
  }

}