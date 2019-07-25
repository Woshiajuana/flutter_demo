
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:woosai_mall/pages/login/components/headerGroup.dart';
import 'package:woosai_mall/pages/login/components/inputGroup.dart';
import 'package:woosai_mall/pages/login/components/buttonGroup.dart';
import 'package:woosai_mall/models/userInfo.model.dart';
import 'package:woosai_mall/redux/app.redux.dart';
import 'package:woosai_mall/redux/userInfo.redux.dart';
import 'package:woosai_mall/application.dart';

class LoginPage extends StatefulWidget {

  static final String sName = 'login';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String _username = '13127590698';
  String _password = '111111';
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new StoreBuilder<AppState>(builder: (context, store){
      return new Scaffold(
        body: new ListView(
          children: <Widget>[
            new HeaderGroup(),
            new InputGroup(
              username: _username,
              password: _password,
              usernameChange: (value) => this.setState(() => _username = value),
              passwordChange: (value) => this.setState(() => _password = value),
            ),
            new ButtonGroup(
              onTap: () => _handleSubmit(store),
            ),
          ],
        ),
      );
    });
  }

  // 提交
  void _handleSubmit(Store store) async {
    try {
      Application.util.loading.show(context);
      var userInfoJson = await Application.service.user.doUserLogin(
        phone: _username,
        password: _password,
      );
      String userInfoJsonKey = Application.config.store.userInfoJson;
      await Application.util.store.set(userInfoJsonKey, userInfoJson);
      UserInfo userInfo = UserInfo.fromJson(userInfoJson);
      store.dispatch(new UpdateUserInfoAction(userInfo));
      Application.util.loading.hide();
      Application.router.replace(context, 'app');
    } catch (err) {
      Application.util.loading.hide();
      Application.util.modal.toast(err);
    }
  }
}