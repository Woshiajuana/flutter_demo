
import 'package:redux/redux.dart';
import 'package:woosai_mall/common/model/userInfoModal.dart';
import 'package:woosai_mall/common/utils/storeUtil.dart';
import 'package:woosai_mall/common/redux/userRedux.dart';

mixin UserMixin {

  // 更新用户数据
  userUpdateInfo (Store store, userInfo) async {
    if (userInfo == null) return null;
    await StoreUtil.save(StoreUtil.USER_INFO, userInfo);
    if (store == null) return null;
    UserInfoModal userInfoModal = UserInfoModal.fromJson(userInfo);
    store.dispatch(new UpdateUserAction(userInfoModal));
    return null;
  }

  // 获取用户数据
  userGetInfo (Store store) async {
    var userInfo = await StoreUtil.get(StoreUtil.USER_INFO);
    if (userInfo == null) return null;
    UserInfoModal userInfoModal = UserInfoModal.fromJson(userInfo);
    store.dispatch(new UpdateUserAction(userInfoModal));
    return userInfoModal;
  }

}