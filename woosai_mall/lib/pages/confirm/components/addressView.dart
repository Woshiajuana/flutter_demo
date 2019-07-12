
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/style/WowStyle.dart';

class AddressView extends StatefulWidget {

  @override
  _AddressViewState createState() => new _AddressViewState();
}

class _AddressViewState extends State<AddressView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Colors.white,
      child: new Row(
        children: <Widget>[
          new Image.asset(
            WOWIcons.logo100,
            width: 36.0,
            height: 36.0,
            fit: BoxFit.fill,
            color: Color(0xffef2c2c),
          ),
          new Expanded(
            flex: 1,
            child: new Container(
              child: new Column(
                children: <Widget>[
                  
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}