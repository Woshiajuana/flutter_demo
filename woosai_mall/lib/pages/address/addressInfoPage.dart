
import 'package:flutter/material.dart';

class AddressInfoPage extends StatefulWidget {

  @override
  _AddressInfoPageState createState() => new _AddressInfoPageState();
}

class _AddressInfoPageState extends State<AddressInfoPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '收货地址详情',
        ),
      ),
      body: new Container(
        color: Color(0xfff2f2f2),
        child: new Column(
          children: <Widget>[
            _inputSection(),
            _buttonItem(),
          ],
        ),
      ),
    );
  }

  Widget _inputSection () {
    return new Expanded(
      flex: 1,
      child: new Column(
        children: <Widget>[
          _inputItem(),
          _inputItem(),
          _inputItem(),
          _inputItem(),
        ],
      ),
    );
  }

  Widget _inputItem () {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Text(
            '收货人姓名',
            style: new TextStyle(
              color: Color(0xff333333),
              fontSize: 14.0,
            ),
          ),
          new Expanded(
            flex: 1,
            child: new TextField(),
          ),
        ],
      ),
    );
  }

  Widget _buttonItem () {
    return new Container(
      height: 50.0,
      color: Color(0xffef2c2c),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            '确认提交',
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
