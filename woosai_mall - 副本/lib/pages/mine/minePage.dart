
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:woosai_mall/pages/mine/compoents/userGroup.dart';
import 'package:woosai_mall/pages/mine/compoents/menuGroup.dart';
import 'package:woosai_mall/pages/mine/compoents/exitGroup.dart';
import 'package:woosai_mall/common/redux/appState.dart';

class MinePage extends StatefulWidget {

  @override
  _MinePageState createState() => new _MinePageState();
}

class _MinePageState extends State<MinePage> {

  @override
  Widget build(BuildContext context) {
    return new StoreBuilder<AppState>(builder: (context, store) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('我的'),
        ),
        body: new Container(
          color: Color(0xfff2f2f2),
          child: new Column(
            children: <Widget>[
              new UserGroup(store: store),
              new MenuGroup(),
              new ExitGroup(),
            ],
          ),
        ),
      );
    });
  }
}