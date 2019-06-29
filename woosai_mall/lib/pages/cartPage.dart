
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('购物车'),
      ),
      body: new Container(
        child: new Text('这是购物车页！'),
      ),
    );
  }
}