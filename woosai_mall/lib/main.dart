
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:woosai_mall/common/model/userInfoModal.dart';
import 'package:woosai_mall/pages/appPage.dart';
import 'package:woosai_mall/pages/welcome/welcomePage.dart';
import 'package:woosai_mall/pages/login/loginPage.dart';
import 'package:woosai_mall/common/redux/appState.dart';
import 'package:woosai_mall/application.dart';

void main() {
  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // 创建Store 引用appState 中的 appReducer 创建的 Reducer
  final store = new Store<AppState>(
    appReducer,
    initialState: new AppState(
      userInfoModal: UserInfoModal.empty(),
    ),
  );

  MyApp({Key key}) : super(key: key);


  // 判断
  void _test() {
    Application.model.userInfo userInfo = Application.model.userInfo.fromJson({});
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    _test();
    return new StoreProvider(
        store: store,
        child: MaterialApp(
          title: 'WoosaiMall',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          routes: <String, WidgetBuilder> {
            '/': (_) => new WelcomePage(),
            'app': (_) => new AppPage(),
            'login': (_) => new LoginPage(),
          },
        ),
    );
  }
}
