
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:woosai_mall/pages/mine/compoents/userGroup.dart';
import 'package:woosai_mall/pages/mine/compoents/menuGroup.dart';
import 'package:woosai_mall/pages/mine/compoents/exitGroup.dart';
import 'package:woosai_mall/redux/app.redux.dart';

class MinePage extends StatefulWidget {

  @override
  _MinePageState createState() => new _MinePageState();
}

class _MinePageState extends State<MinePage> with AutomaticKeepAliveClientMixin {


  @override
  bool get wantKeepAlive => true; // 要点2

  @override
  Widget build(BuildContext context) {
    super.build(context); // 要点3
    // TODO: implement build
    return new StoreBuilder<AppState>(builder: (context, store) {
      return new Scaffold(
        appBar: new AppBar(
          title: new Text('我的'),
        ),
        body: new Container(
          color: Color(0xfff2f2f2),
          child: new ListView(
            children: <Widget>[
              new UserGroup(store: store),
              new MenuGroup(),
              new MenuGroup(),
              new MenuGroup(),
              new MenuGroup(),
              new ExitGroup(),
            ],
          ),
        ),
      );
    });
  }
}