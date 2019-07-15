
import 'package:flutter/material.dart';

class InputGroup extends StatefulWidget {

  @override
  _InputGroupState createState() => new _InputGroupState();
}

class _InputGroupState extends State<InputGroup> {

  // 手机号的控制器
  TextEditingController phoneController;
  //密码的控制器
  TextEditingController passController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    phoneController = TextEditingController();
    passController = TextEditingController();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    phoneController.dispose();
    passController.dispose();
    phoneController = null;
    passController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    phoneController.text = '1111';
    passController.text = '222';
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 32.0),
      child: new Column(
        children: <Widget>[
          new Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: new TextField(
              controller: phoneController,
              decoration: new InputDecoration(
                labelText: '账号',
              ),
            ),
          ),

          new Container(
            margin: const EdgeInsets.only(top: 16.0),
            child: new TextField(
              controller: passController,
              obscureText: true,
              decoration: new InputDecoration(
                labelText: '密码',
              ),
            ),
          ),
        ],
      ),
    );
  }
}