
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
    'address': {
      'route': (_) => new AddressPage(),
      'handle': (params) {
        return new AddressPage();
      }
    },
    'addressInfo': {
      'route': (_) => new AddressInfoPage(),
      'handle': (params) {
        return new AddressInfoPage();
      }
    },
    'confirm': {
      'route': (_) => new ConfirmPage(),
      'handle': (params) {
        return new ConfirmPage();
      }
    },
    'list': {
      'route': (_) => new ListPage(),
      'handle': (params) {
        return new ListPage();
      }
    },
    'details': {
      'route': (_) => new DetailsPage(),
      'handle': (params) {
        return new DetailsPage();
      }
    },
  };

  static Map<String, WidgetBuilder> _routes;

  Map<String, WidgetBuilder> get routes {
    if (_routes != null) return _routes;
    _routes = {};
    config.forEach((key, value) {
      _routes[key] = value['route'];
    });
    return _routes;
  }

  push (BuildContext context, path, { params }) {
    return navigatorRouter(context, config[path]['handle']());
  }

  // 修改路由动画
  static navigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => widget));
  }

}