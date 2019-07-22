
import 'package:flutter/material.dart';

class MenuGroup extends StatefulWidget {

  @override
  _MenuGroupState createState() => new _MenuGroupState();
}

class _MenuGroupState extends State<MenuGroup> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      decoration: new BoxDecoration(
        border: new Border(
          top: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
        ),
      ),
      child: new Column(
        children: <Widget>[
          _menuItem(),
          _menuItem(),
          _menuItem(),
          _menuItem(),
          _menuItem(),
          _menuItem(),
        ],
      ),
    );
  }

  Widget _menuItem () {
    return new Container(
      height: 45.0,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          bottom: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
        ),
      ),
      child: new Row(
        children: <Widget>[
          new Icon(
            Icons.assignment,
            color: Colors.blue,
          ),
          new Expanded(
            flex: 1,
            child: new Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: new Text(
                '菜单1',
                style: new TextStyle(
                  color: Color(0xff666666),
                  fontSize: 13.0,
                ),
              ),
            ),
          ),
          new Icon(
            Icons.arrow_forward_ios,
            color: Color(0xff999999),
          ),
        ],
      ),
    );
  }
}