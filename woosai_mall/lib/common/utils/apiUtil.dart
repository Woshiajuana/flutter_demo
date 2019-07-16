
import 'package:fluttertoast/fluttertoast.dart';
import 'package:woosai_mall/common/utils/httpUtil.dart';
import 'package:woosai_mall/common/config/httpConfig.dart';
import 'package:woosai_mall/common/model/userInfoModal.dart';

class ApiUtil {
  static userLogin(username, password) async {
    UserInfoModal userInfoModal;
    try {
      Map requestParams = {
        'phone': username,
        'password': password,
      };
      var respBody = await HttpUtil.request(HttpConfig.USER_LOGIN, data: requestParams);
      userInfoModal = UserInfoModal.fromJson(respBody);
    } catch (err) {
      Fluttertoast.showToast(gravity: ToastGravity.CENTER, msg: err);
    }
    return userInfoModal;
  }
}