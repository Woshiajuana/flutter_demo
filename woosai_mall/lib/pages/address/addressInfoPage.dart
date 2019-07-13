
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
        actions: <Widget>[
          new Row(
            children: <Widget>[
              new Container(
                margin: const EdgeInsets.only(right: 10.0),
                child: new Icon(Icons.add),
              )
            ],
          )
        ],
      ),
      body: new Container(
        color: Color(0xfff2f2f2),
        child: new ListView(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}
