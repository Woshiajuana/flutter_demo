
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
import 'package:woosai_mall/pages/order/orderPage.dart';
import 'package:woosai_mall/pages/order/orderDetailsPage.dart';

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
    'order': {
      'route': (_) => new OrderPage(),
      'handle': (params) {
        return new OrderPage();
      }
    },
    'orderDetails': {
      'route': (_) => new OrderDetailsPage(),
      'handle': (params) {
        return new OrderDetailsPage(orderNo: params['orderNo'],);
      }
    },
    'address': {
      'route': (_) => new AddressPage(),
      'handle': (params) {
        return new AddressPage(from: params['from']);
      }
    },
    'addressInfo': {
      'route': (_) => new AddressInfoPage(),
      'handle': (params) {
        return new AddressInfoPage(addressId: params['addressId']);
      }
    },
    'confirm': {
      'route': (_) => new ConfirmPage(),
      'handle': (params) {
        return new ConfirmPage(specs: params['specs'], goodsId: params['goodsId'],);
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
        return new DetailsPage(goodsId: params['goodsId'],);
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

  push (BuildContext context, routeName, {params}) {
    return navigatorRouter(context, config[routeName]['handle'](params));
  }

  replace (BuildContext context, String routeName) {
    return Navigator.pushReplacementNamed(context, routeName);
  }

  pop (BuildContext context, {params}) {
    return Navigator.of(context).pop(params);
  }

  // 修改路由动画
  static navigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => widget));
  }

}