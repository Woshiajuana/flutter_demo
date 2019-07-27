
import 'package:flutter/material.dart';
import 'package:woosai_mall/models/goodsItem.modal.dart';

class OperationView extends StatefulWidget {

  const OperationView({
    Key key,
    this.data,
    this.customerPhone,
    this.onJump,
  }) : super(key: key);

  final GoodsItemModal data;
  final String customerPhone;
  final dynamic onJump;


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
            child: new FlatButton(
              onPressed: () {},
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
                ]
              ),
            ),
          ),
          new Expanded(
            child: new Container(
              height: 50.0,
              color: (widget?.data?.goodsStockNum ?? -1) <= 0 ? Color(0xff999999) : Color(0xffef2c2c),
              child: new FlatButton(
                onPressed: () => widget?.onJump(),
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