
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:woosai_mall/pages/appPage.dart';
import 'package:woosai_mall/pages/welcome/welcomePage.dart';
import 'package:woosai_mall/pages/login/loginPage.dart';
import 'package:woosai_mall/pages/list/listPage.dart';
import 'package:woosai_mall/pages/details/detailsPage.dart';
import 'package:woosai_mall/pages/confirm/confirmPage.dart';
import 'package:woosai_mall/pages/address/addressPage.dart';
import 'package:woosai_mall/pages/address/addressInfoPage.dart';
import 'package:woosai_mall/pages/login/loginPage.dart';

class Router {

  static final Router _router = Router._internal();

  factory Router () {
    return _router;
  }

  Router._internal();

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
    config.forEach((key, value) {
      routes[key] = value['route'];
    });
    return routes;
  }

  push (BuildContext context, path, { params }) {
    return navigatorRouter(context, config[path]['handle']());
  }

  // 修改路由动画
  static navigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => widget));
  }


}