
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:woosai_mall/models/userInfo.model.dart';
import 'package:woosai_mall/redux/app.redux.dart';
import 'package:woosai_mall/redux/userInfo.redux.dart';
import 'package:woosai_mall/application.dart';

class WelcomePage extends StatefulWidget {

  @override
  _WelcomePageState createState() => new _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {

  @override
  void didChangeDependencies() async {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    String userInfoJsonKey = Application.config.store.userInfoJson;
    var userInfoJson = await Application.util.store.get(userInfoJsonKey);
    if (userInfoJson == null) {
      Application.router.push(context, 'login');
      return;
    }
    UserInfo userInfo = UserInfo.fromJson(userInfoJson);
    Store<AppState> store = StoreProvider.of(context);
    store.dispatch(new UpdateUserInfoAction(userInfo));
    Application.router.push(context, 'app');
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