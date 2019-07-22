
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/utils/routerUtil.dart';

class OperationView extends StatefulWidget {

  @override
  _OperationViewState createState() => new _OperationViewState();
}

class _OperationViewState extends State<OperationView> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 50.0,
      child: new Row(
        children: <Widget>[
          new Container(
            height: 50.0,
            width: 125.0,
            color: Color(0xffc1c1c1),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text('客服',
                  style: new TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 16.0,
                  ),
                ),
              ],
            ),
          ),
          new Expanded(
            child: new InkWell(
              onTap: () => RouterUtil.pushConfirm(context),
              child: new Container(
                height: 50.0,
                color: Color(0xffef2c2c),
                child: new Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    new Text('立即抢购',
                      style: new TextStyle(
                        color: Color(0xffffffff),
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}