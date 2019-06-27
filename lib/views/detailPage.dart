
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  @override
  DetailPageState createState() => new DetailPageState();
}

class DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          title: new Text('详情')
      ),
      body: new Center(
        child: new Text('这是详情界面'),
      ),
    );
  }
}