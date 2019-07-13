
import 'package:flutter/material.dart';

class AddressPage extends StatefulWidget {

  @override
  _AddressPageState createState() => new _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '收货地址',
        ),
      ),
    );
  }
}
