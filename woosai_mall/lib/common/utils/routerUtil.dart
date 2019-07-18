
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:woosai_mall/pages/appPage.dart';
import 'package:woosai_mall/pages/list/listPage.dart';
import 'package:woosai_mall/pages/details/detailsPage.dart';
import 'package:woosai_mall/pages/confirm/confirmPage.dart';
import 'package:woosai_mall/pages/address/addressPage.dart';
import 'package:woosai_mall/pages/address/addressInfoPage.dart';
import 'package:woosai_mall/pages/login/loginPage.dart';

class RouterUtil {

  static pushApp (BuildContext context) {
    Navigator.pushReplacementNamed(context, AppPage.sName);
  }

  static pushLogin (BuildContext context) {
    Navigator.pushReplacementNamed(context, LoginPage.sName);
  }

  static pushAddressInfo (BuildContext context) {
    navigatorRouter(context, new AddressInfoPage());
  }

  static pushAddress (BuildContext context) {
    navigatorRouter(context, new AddressPage());
  }

  static pushConfirm (BuildContext context) {
    navigatorRouter(context, new ConfirmPage());
  }

  static pushList (BuildContext context) {
    navigatorRouter(context, new ListPage());
  }

  static pushDetails (BuildContext context, { goodsId }) {
    print('goodsId$goodsId');
    navigatorRouter(context, new DetailsPage(goodsId: goodsId));
  }

  // 修改路由动画
  static navigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => widget));
  }

}