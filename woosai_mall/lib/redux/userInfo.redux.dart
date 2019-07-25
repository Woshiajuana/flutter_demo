
import 'package:redux/redux.dart';
import 'package:woosai_mall/models/userInfo.model.dart';

final userInfoReducer = combineReducers<UserInfo>([
  TypedReducer<UserInfo, UpdateUserInfoAction>(_updateLoaded),
]);

UserInfo _updateLoaded(UserInfo user, action) {
  user = action.userInfo;
  return user;
}

class UpdateUserInfoAction {
  final UserInfo userInfo;
  UpdateUserInfoAction(this.userInfo);
}