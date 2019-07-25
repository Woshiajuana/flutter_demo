

import 'package:woosai_mall/redux/userInfo.redux.dart';
import 'package:woosai_mall/models/userInfo.model.dart';

// 全局Redux store 的对象，保存State数据
class AppState {

  UserInfo userInfo;

  AppState({
    this.userInfo,
  });

}

// 创建 Reducer
// 源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
// 我们自定义了 appReducer 用于创建 store
AppState appReducer(AppState state, action) {
  return AppState(
    userInfo: userInfoReducer(state.userInfo, action),
  );
}