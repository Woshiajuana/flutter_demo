

import 'package:redux/redux.dart';
import 'package:woosai_mall/common/model/userInfoModal.dart';

final userReducer = combineReducers<UserInfoModal>([
  TypedReducer<UserInfoModal, UpdateUserAction>(_updateLoaded),
]);

UserInfoModal _updateLoaded(UserInfoModal user, action) {
  user = action.userInfoModal;
  return user;
}

class UpdateUserAction {
  final UserInfoModal userInfoModal;
  UpdateUserAction(this.userInfoModal);
}