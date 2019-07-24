

class Store {

  static final Store _store = Store._internal();

  factory Store () {
    return _store;
  }

  Store._internal();

  // 登录
  String get accessToken {
    return 'ACCESS-TOKEN';
  }
  
}