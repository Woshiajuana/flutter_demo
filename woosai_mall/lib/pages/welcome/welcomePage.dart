
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:woosai_mall/common/utils/routerUtil.dart';
import 'package:woosai_mall/common/mixins/userMixin.dart';
import 'package:woosai_mall/common/redux/appState.dart';

class WelcomePage extends StatefulWidget {

  @override
  _WelcomePageState createState() => new _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> with UserMixin {

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    Store<AppState> store = StoreProvider.of(context);
    var userInfo = await userGetInfo(store);
    userInfo == null ? RouterUtil.pushApp(context) : RouterUtil.pushApp(context);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: new Image(
        fit: BoxFit.fill,
        image: new AssetImage('assets/images/launch_image.png')),
    );
  }
}