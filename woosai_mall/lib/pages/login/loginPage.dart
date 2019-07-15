
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/login/components/headerGroup.dart';
import 'package:woosai_mall/pages/login/components/inputGroup.dart';
import 'package:woosai_mall/pages/login/components/buttonGroup.dart';

class LoginPage extends StatefulWidget {
  
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String username = '';
  String password = '';
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      body: new ListView(
        children: <Widget>[
          new HeaderGroup(),
          new InputGroup(
            username: username,
            password: password,
            usernameChange: (value) => this.setState(() => username = value),
            passwordChange: (value) => this.setState(() => password = value),
          ),
          new ButtonGroup(
            onTap: () => _handleSubmit(),
          ),
        ],
      ),
    );
  }

  // 提交
  void _handleSubmit() {

  }
}