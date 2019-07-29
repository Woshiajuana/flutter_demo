
import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  @override
  OrderPageState createState() => new OrderPageState();
}

class OrderPageState extends State<OrderPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: new AppBar(
        title: new Text('我的订单'),
      ),
      body: new ListView(
        children: <Widget>[

        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }




}