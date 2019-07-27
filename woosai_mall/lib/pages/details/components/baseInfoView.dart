
import 'package:flutter/material.dart';
import 'package:woosai_mall/models/goodsItem.modal.dart';

class BaseInfoView extends StatefulWidget {

  const BaseInfoView({
    Key key,
    this.data,
  }) : super(key: key);

  final GoodsItemModal data;

  @override
  _BaseInfoViewState createState() => new _BaseInfoViewState();
}

class _BaseInfoViewState extends State<BaseInfoView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Color(0xffffffff),
      padding: const EdgeInsets.only(top: 10.0),
      child: new Column(
        children: <Widget>[
          _amountSection(),
          _integralSection(),
          _infoTextSection(),
          _cellTextSection(
            labelText: '抢购时间',
            valueText: _formatTime(),
          ),
          _cellTextSection(
            labelText: '库存',
            valueText: widget?.data?.goodsStockNum?.toString() ?? '0',
          ),
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
            '￥${_formatAmount(widget?.data?.goodsDiscountPrice ?? 0)}',
            style: new TextStyle(
              color: Color(0xffef2c2c),
              fontSize: 24.0,
            ),
          ),
          new Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: new Text(
              '￥${_formatAmount(widget?.data?.goodsPrice ?? 0)}',
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
                '${widget?.data?.discountPoints}积分可再减${widget?.data?.discountPoints}元',
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
      child: new Row(
        children: <Widget>[
          new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              new Container(
                child: new Text(
                  widget?.data?.goodsName ?? '',
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
                  widget?.data?.goodsDetails ?? '',
                  style: new TextStyle(
                    color: Color(0xff999999),
                    fontSize: 14.0,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  Widget _cellTextSection ({String labelText, String valueText}) {
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
            labelText,
            style: new TextStyle(
              color: Color(0xff666666),
              fontSize: 12.0,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          new Text(
            valueText,
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

  String _formatAmount (int data) {
    double amount = data / 100;
    return amount?.toString() ?? '--';
  }

  String _formatTime () {
    var startTime = widget?.data?.startTime;
    var endTime = widget?.data?.endTime;
    var now = new DateTime.now();
    var a=now.millisecondsSinceEpoch;  //时间戳
    print(DateTime.fromMillisecondsSinceEpoch(a));
    return '';
  }
}