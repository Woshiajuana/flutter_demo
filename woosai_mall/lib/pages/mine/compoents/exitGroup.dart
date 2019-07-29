
import 'package:flutter/material.dart';
import 'package:woosai_mall/application.dart';
import 'package:woosai_mall/components/confirmDialog.dart';

class ExitGroup extends StatefulWidget {

  @override
  _ExitGroupState createState() => new _ExitGroupState();
}

class _ExitGroupState extends State<ExitGroup> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      width: 180.0,
      height: 44.0,
      decoration: new BoxDecoration(
        color: Color(0xffef2c2c),
        borderRadius: BorderRadius.circular(22.0),
      ),
      child: new FlatButton(
        onPressed: () => _handleExitOut(),
        child: new Text(
          '安全退出',
          style: new TextStyle(
            color: Colors.white,
            fontSize: 14.0,
          ),
        ),
      ),
    );
  }

  void _handleExitOut () async {
    var result = await showDialog(
      context: context,
      builder: (BuildContext buildContext) {
        return new ConfirmDialog(
          content: '您确定要退出此账号吗？',
        );
      },
    );
    if (result != true) return;
    try {
      await Application.util.store.clear();
    } catch (err) {

    } finally {
      Application.router.replace(context, 'login');
    }
  }

}