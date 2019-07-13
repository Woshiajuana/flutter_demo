
import 'package:flutter/material.dart';

class ExitGroup extends StatefulWidget {

  @override
  _ExitGroupState createState() => new _ExitGroupState();
}

class _ExitGroupState extends State<ExitGroup> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 50.0),
      height: 45.0,
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          top: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
          bottom: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
        ),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            '安全退出',
            style: new TextStyle(
              color: Color(0xffef2c2c),
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}