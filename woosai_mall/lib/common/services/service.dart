
import 'package:woosai_mall/common/services/user.service.dart';
import 'package:woosai_mall/common/services/goods.service.dart';
import 'package:woosai_mall/common/services/address.service.dart';

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

  Address get address {
    return new Address();
  }

}