
import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {

  @override
  _DetailsPageState createState() => new _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('商品详情'),
      ),
      body: new Text('商品详情页面'),
    );
  }
}