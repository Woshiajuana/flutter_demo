
import 'package:woosai_mall/services/user.service.dart';
import 'package:woosai_mall/services/goods.service.dart';

class Service {

  static final Service _service = Service._internal();

  factory Service () {
    return _service;
  }

  Service._internal();

  User get user {
    return new User();
  }

  Goods get goods {
    return new Goods();
  }

}