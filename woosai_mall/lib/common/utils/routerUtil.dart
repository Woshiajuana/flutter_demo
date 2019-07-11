
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:woosai_mall/pages/list/listPage.dart';
import 'package:woosai_mall/pages/details/detailsPage.dart';

class RouterUtil {

  static pushList (BuildContext context) {
    NavigatorRouter(context, new ListPage());
  }

  static pushDetails (BuildContext context) {
    NavigatorRouter(context, new DetailsPage());
  }

  // 修改路由动画
  static NavigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => widget));
  }

}