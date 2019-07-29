
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/application.dart';

class OrderPage extends StatefulWidget {
  @override
  OrderPageState createState() => new OrderPageState();
}

class OrderPageState extends State<OrderPage> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: new AppBar(
        title: new Text('我的订单'),
      ),
      body: new ListView(
        children: <Widget>[
          _widgetOrderCellItem(),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget _widgetOrderCellItem () {
    return new Container(
      child: new Column(
        children: <Widget>[
          _widgetOrderGoods(),
          new Container(
            child: new Row(
              children: <Widget>[
                new Text(
                  '待支付',
                  style: new TextStyle(
                    fontSize: 16.0,
                    color: Color(0xff333333),
                  ),
                ),
                new Container(

                  child: new FlatButton(
                    onPressed: () => {},
                    child: new Text(
                      '查看详情',
                      style: new TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff333333),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _widgetOrderGoods () {
    return new Container(
      child: new Row(
        children: <Widget>[
          new Container(
            child: new FadeInImage.assetNetwork(
              placeholder: Application.config.style.srcGoodsNull,
              image: '',
            ),
          ),
          new Expanded(
            child: new Container(
              child: new Column(
                children: <Widget>[
                  new Container(
                    child: new Text(
                      '测试商品',
                      style: new TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff333333),
                      ),
                    ),
                  ),
                  new Expanded(flex: 1, child: new Container()),
                  new Row(
                    children: <Widget>[
                      new Text(
                        '￥1111',
                        style: new TextStyle(
                          fontSize: 13.0,
                          color: Color(0xff999999),
                        ),
                      ),
                      new Expanded(flex: 1, child: new Container()),
                      new Text(
                        '￥1111',
                        style: new TextStyle(
                          fontSize: 13.0,
                          color: Color(0xff999999),
                        ),
                      ),
                      new Text(
                        '￥1111',
                        style: new TextStyle(
                          fontSize: 13.0,
                          color: Color(0xff333333),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )

        ],
      ),
    );
  }




}