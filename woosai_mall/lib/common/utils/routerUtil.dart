
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:woosai_mall/pages/list/listPage.dart';
import 'package:woosai_mall/pages/details/detailsPage.dart';

class RouterUtil {


  static  Map<String, dynamic> toJson() => {
    'type': 'type',
  };

  static Map<String, dynamic> routes = {
    'list': ListPage,
  };

  static Widget xx () {
    print('1');
    print(routes['list']());
    return new ListPage();
  }

  static pushList (BuildContext context) {
//    Navigator.pushNamed(context, 'list');
    xx();
//    NavigatorRouter(context, xx());
  }

  // 修改路由动画
  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => widget));
  }

}