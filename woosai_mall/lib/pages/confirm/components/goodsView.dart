
import 'package:flutter/material.dart';
import 'package:woosai_mall/models/goodsItem.modal.dart';

class GoodsView extends StatefulWidget {

  const GoodsView({
    Key key,
    this.data,
    this.list,
  }) : super(key: key);


  final GoodsItemModal data;
  final List list;

  @override
  _GoodsViewState createState() => new _GoodsViewState();
}

class _GoodsViewState extends State<GoodsView> {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      color: Color(0xfff2f2f2),
      padding: const EdgeInsets.only(top: 12.0, bottom: 12.0, left: 16.0, right: 16.0),
      child: new Row(
        children: <Widget>[
          _goodsImageSection(),
          _goodsInfoSection(),
        ],
      ),
    );
  }

  Widget _goodsImageSection () {
    return new Container(
      width: 62.0,
      height: 62.0,
      child:new ClipRRect(
        borderRadius: BorderRadius.circular(8.0),
        child: new Image.network(
          _goodsImage(),
          fit: BoxFit.fill,
        ),
      ),
    );
  }

  Widget _goodsInfoSection () {
    return new Expanded(
      flex: 1,
      child: new Container(
        height: 62.0,
        padding: const EdgeInsets.only(left: 10.0, top: 5.0, bottom: 5.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            new Text(
              widget?.data?.goodsName ?? '',
              style: new TextStyle(
                color: Color(0xff666666),
                fontSize: 14.0
              ),
            ),
            new Text(
              _formatAmount(widget?.data?.goodsDiscountPrice ?? 0),
              style: new TextStyle(
                color: Color(0xff999999),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _goodsImage () {
    if (widget.data == null) return '';
    List list = [];
    widget.list?.forEach((item) {
      if (item['type'] == 'thumbnail') {
        list = item['filePath'].split(',');
      }
    });
    return list[0];
  }

  String _formatAmount (int data) {
    double amount = data / 100;
    return '￥' + amount?.toString() ?? '--';
  }
}