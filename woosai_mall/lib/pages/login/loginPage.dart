
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/login/components/headerGroup.dart';
import 'package:woosai_mall/pages/login/components/inputGroup.dart';
import 'package:woosai_mall/pages/login/components/buttonGroup.dart';

class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '用户登录'
        ),
      ),
      body: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new HeaderGroup(),
          new InputGroup(),
          new ButtonGroup(),
        ],
      ),
    );
  }
}