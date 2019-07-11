
import 'package:flutter/material.dart';

class BaseInfoView extends StatefulWidget {

  @override
  _BaseInfoViewState createState() => new _BaseInfoViewState();
}

class _BaseInfoViewState extends State<BaseInfoView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      padding: const EdgeInsets.only(top: 10.0),
      child: new Column(
        children: <Widget>[
          _amountSection(),
          _integralSection(),
          _infoTextSection(),
          _cellTextSection(),
          _cellTextSection(),
        ],
      ),
    );
  }

  Widget _amountSection () {
    return new Container(
      height: 33.0,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(
            '￥999.99',
            style: new TextStyle(
              color: Color(0xffef2c2c),
              fontSize: 24.0,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: new Text(
              '￥1000.00',
              style: new TextStyle(
                color: Color(0xff999999),
                fontSize: 16.0,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _integralSection () {
    return new Container(
      height: 33.0,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: new Container(
              padding: const EdgeInsets.only(top: 2.0, bottom: 3.0, right: 10.0, left: 10.0),
              color: Color(0xffef2c2c),
              child: new Text(
                '180积分可再减180.00元',
                style: new TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              ),
            ),
          ),
          new Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              new Text(
                '当前可用积分：',
                style: new TextStyle(
                  color: Color(0xff999999),
                  fontSize: 12.0,
                ),
              ),
              new Text(
                '598',
                style: new TextStyle(
                  color: Color(0xffef2c2c),
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _infoTextSection () {
    return new Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 12.0),
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
        ),
      ),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            child: new Text(
              '测试商测试商品品',
              style: new TextStyle(
                color: Color(0xff333333),
                fontSize: 18.0,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          new Container(
            child: new Text(
              '测试商品测试测试商品测试商品测试商品测试商品测试商品测试商品测试商品商品测试商品测试商品测试商品测试商品测试商品',
              style: new TextStyle(
                color: Color(0xff999999),
                fontSize: 14.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }

  Widget _cellTextSection () {
    return new Container(
      height: 40.0,
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: new BoxDecoration(
        border: new Border(
          bottom: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
        ),
      ),
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          new Text(
            '抢购时间',
            style: new TextStyle(
              color: Color(0xff666666),
              fontSize: 12.0,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          new Text(
            '2019-06-26 12:12:12 — 2019-06-26 12:12:12',
            style: new TextStyle(
              color: Color(0xffef2c2c),
              fontSize: 12.0,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}