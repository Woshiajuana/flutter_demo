
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
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('我的订单'),
      ),
      body: new ListView(
        children: <Widget>[
          _widgetOrderCellItem(),
          _widgetOrderCellItem(),
          _widgetOrderCellItem(),
          _widgetOrderCellItem(),
          _widgetOrderCellItem(),
          _widgetOrderCellItem(),
          _widgetOrderCellItem(),
          _widgetOrderCellItem(),
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
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      color: Color(0xfff2f2f2),
      child: new Column(
        children: <Widget>[
          _widgetOrderGoods(),
          new Container(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            decoration: new BoxDecoration(
              border: new Border(
                top: new BorderSide(
                  color: Color(0xffdddddd),
                  width: 0.5,
                ),
              ),
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  '待支付',
                  style: new TextStyle(
                    fontSize: 16.0,
                    color: Color(0xff333333),
                  ),
                ),
                new Container(
                  height: 40.0,
                  decoration: new BoxDecoration(
                    border: Border.all(
                      color: Color(0xff999999),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
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
      padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
      child: new Row(
        children: <Widget>[
          new Container(
            width: 80.0,
            height: 80.0,
            margin: const EdgeInsets.only(right: 16.0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: new FadeInImage.assetNetwork(
                width: 80.0,
                height: 80.0,
                placeholder: Application.config.style.srcGoodsNull,
                image: 'https://ss0.baidu.com/73F1bjeh1BF3odCf/it/u=2970307425,3387989531&fm=85',
                fit: BoxFit.fill,
              ),
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Container(
              height: 80.0,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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