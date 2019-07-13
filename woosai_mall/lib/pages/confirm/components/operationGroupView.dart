
import 'package:flutter/material.dart';

class OperationGroupView extends StatefulWidget {

  @override
  _OperationGroupViewState createState() => new _OperationGroupViewState();
}

class _OperationGroupViewState extends State<OperationGroupView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      height: 50.0,
      padding: const EdgeInsets.only(right: 16.0),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          new Container(
            child: new Text(
              '合计',
              style: new TextStyle(
                color: Color(0xff666666),
                fontSize: 13.0,
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(left: 10.0),
            child: new Text(
              '￥99.99',
              style: new TextStyle(
                color: Color(0xffef2c2c),
                fontSize: 14.0,
              ),
            ),
          ),
          new Container(
            width: 96.0,
            height: 30.0,
            margin: const EdgeInsets.only(left: 10.0),
            decoration: new BoxDecoration(
              color: Color(0xffef2c2c),
              borderRadius: new BorderRadius.circular(15.0),
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Text(
                  '提交订单',
                  style: new TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}