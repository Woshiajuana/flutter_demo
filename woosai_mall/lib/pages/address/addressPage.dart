
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/address/components/addressItem.dart';
import 'package:woosai_mall/application.dart';
import 'package:woosai_mall/models/addressItem.model.dart';

class AddressPage extends StatefulWidget {

  @override
  _AddressPageState createState() => new _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _req
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '收货地址',
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
            new AddressItem(),
            new AddressItem(),
            new AddressItem(),
          ],
        ),
      ),
    );
  }

  void _req () async {
    try {

    } catch (e) {

    }
  }
}
