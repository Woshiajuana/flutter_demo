
import 'package:flutter/material.dart';

class MinePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('我的'),
      ),
      body: new Container(
        child: new Text('这是我的页！'),
      ),
    );
  }
}