
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:woosai_mall/pages/login/components/headerGroup.dart';
import 'package:woosai_mall/pages/login/components/inputGroup.dart';
import 'package:woosai_mall/pages/login/components/buttonGroup.dart';
import 'package:woosai_mall/common/utils/apiUtil.dart';
import 'package:woosai_mall/common/utils/routerUtil.dart';
import 'package:woosai_mall/common/redux/appState.dart';
import 'package:woosai_mall/common/mixins/userMixin.dart';
import 'package:woosai_mall/application.dart';

class LoginPage extends StatefulWidget {

  static final String sName = 'login';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with UserMixin {

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
//    try {
      await Application.service.user.doUserLogin(phone: _username, password: _password);
//    } catch (err) {
//      print('err.message => $err');
//      Application.util.modal.toast(err);
//    }

//    var respBody = await ApiUtil.userLogin(_username, _password);
//    if (respBody == null) return;
//    await userUpdateInfo(store, respBody);
//    RouterUtil.pushApp(context);
  }
}