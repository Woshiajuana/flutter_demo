
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

  static pushAddressInfo (BuildContext context, {addressId}) {
    return navigatorRouter(context, new AddressInfoPage(addressId: addressId));
  }

  static pushAddress (BuildContext context, {String from}) {
    return navigatorRouter(context, new AddressPage(from: from));
  }

  static pushConfirm (BuildContext context, {int goodsId, String specs}) {
    return navigatorRouter(context, new ConfirmPage(goodsId: goodsId, specs: specs??''));
  }

  static pushList (BuildContext context) {
    return navigatorRouter(context, new ListPage());
  }

  static pushDetails (BuildContext context, { goodsId }) {
    return navigatorRouter(context, new DetailsPage(goodsId: goodsId));
  }

  // 修改路由动画
  static navigatorRouter(BuildContext context, Widget widget) {
    return Navigator.push(context, new CupertinoPageRoute(builder: (context) => widget));
  }

}