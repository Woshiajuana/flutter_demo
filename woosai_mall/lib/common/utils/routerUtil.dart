
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:woosai_mall/pages/list/listPage.dart';

class RouterUtil {

  static pushList (BuildContext context) {
//    Navigator.pushNamed(context, 'list');
    NavigatorRouter(context, new ListPage());
  }

  // 修改路由动画
  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => widget));
  }

}