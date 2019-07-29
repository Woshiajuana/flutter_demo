
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/application.dart';

class MenuGroup extends StatefulWidget {

  const MenuGroup({
    Key key,
  }) : super(key: key);

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
          _menuItem(
            icon: Icons.assignment,
            labelText: '我的订单',
            onPressed: () => Application.router.push(context, 'order'),
          ),
          _menuItem(
            icon: Icons.location_on,
            labelText: '收货地址',
            onPressed: () => Application.router.push(context, 'address', params: {'from': 'mine'}),
          ),
        ],
      ),
    );
  }

  Widget _menuItem ({
    String labelText,
    IconData icon,
    dynamic onPressed,
  }) {
    return new Container(
      height: 60.0,
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
      child: new FlatButton(
        onPressed: onPressed,
        padding: const EdgeInsets.all(0),
        child: new Row(
          children: <Widget>[
            new Icon(
              icon,
              color: Colors.blue,
            ),
            new Expanded(
              flex: 1,
              child: new Container(
                margin: const EdgeInsets.only(left: 10.0),
                child: new Text(
                  labelText,
                  style: new TextStyle(
                    color: Color(0xff666666),
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            new Icon(
              Icons.arrow_forward_ios,
              color: Color(0xff999999),
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}