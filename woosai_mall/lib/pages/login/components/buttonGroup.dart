
import 'package:flutter/material.dart';

class ButtonGroup extends StatefulWidget {

  @override
  _ButtonGroupState createState() => new _ButtonGroupState();
}

class _ButtonGroupState extends State<ButtonGroup> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 45.0,
      margin: const EdgeInsets.only(left: 16.0, right: 16.0, top: 32.0),
      decoration: new BoxDecoration(
        color: Colors.blue,
        borderRadius: new BorderRadius.circular(30.0),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            '登录',
            style: new TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }

}