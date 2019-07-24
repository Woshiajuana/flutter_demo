
import 'package:woosai_mall/application.dart';

class User {

  static final User _user = User._internal();

  factory User () {
    return _user;
  }

  User._internal();

  Future doUserLogin ({ String phone, String password }) async {
    String url = Application.config.api.doUserLogin;
    Map params = {'phone': phone, 'password': password};
    var respBody = await Application.util.http.get(url, params: params);
  }

}