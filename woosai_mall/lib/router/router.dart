
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:woosai_mall/pages/appPage.dart';
import 'package:woosai_mall/pages/welcome/welcomePage.dart';
import 'package:woosai_mall/pages/login/loginPage.dart';
import 'package:woosai_mall/pages/address/addressPage.dart';

class Router {

  static Map<String, Map<String, dynamic>> config = {
    '/': {
      'route': (_) => new WelcomePage(),
      'handle': (params) {
        return new WelcomePage();
      }
    },
    'app': {
      'route': (_) => new AppPage(),
      'handle': (params) {
        return new AppPage();
      }
    },
    'login': {
      'route': (_) => new LoginPage(),
      'handle': (params) {
        return new LoginPage();
      }
    },
  };

  Map<String, WidgetBuilder> get routes {
    Map<String, WidgetBuilder> routes = {};

    ()

    return
  };

  push (BuildContext context) {
    return navigatorRouter(context, new AddressPage());
  }

  // 修改路由动画
  static navigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => widget));
  }


}