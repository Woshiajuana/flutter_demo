
import 'package:flutter/material.dart';
import 'package:redux/redux.dart';
import 'package:woosai_mall/common/redux/appState.dart';

class UserGroup extends StatefulWidget {

  final Store<AppState> store;

  const UserGroup({
    Key key,
    this.store,
  }) : super(key: key);


  @override
  _UserGroupState createState() => new _UserGroupState();
}

class _UserGroupState extends State<UserGroup> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 120.0,
      margin: const EdgeInsets.all(16.0),
      decoration: new BoxDecoration(
        color: Colors.blue,
        borderRadius: new BorderRadius.circular(8.0),
      ),
      child: new Row(
        children: <Widget>[
          new Container(
            width: 60.0,
            height: 60.0,
            margin: const EdgeInsets.only(left: 16.0, right: 16.0),
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: new BorderRadius.circular(30.0),
            ),
          ),
          new Text(
            widget.store?.state?.userInfoModal?.phone??'您好请先登录',
            style: new TextStyle(
              color: Colors.white,
              fontSize: 18.0,
            ),
          ),
        ],
      ),
    );
  }
}