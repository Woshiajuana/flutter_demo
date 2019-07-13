
import 'package:flutter/material.dart';

class UserGroup extends StatefulWidget {

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
            '陈先生',
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