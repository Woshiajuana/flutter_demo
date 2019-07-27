
import 'package:flutter/material.dart';
import 'package:woosai_mall/models/goodsItem.modal.dart';

class SpecsGroupView extends StatefulWidget {

  const SpecsGroupView({
    Key key,
    this.data,

  }) : super(key: key);

  final GoodsItemModal data;

  @override
  _SpecsGroupViewState createState() => new _SpecsGroupViewState();
}

class _SpecsGroupViewState extends State<SpecsGroupView> {

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      margin: const EdgeInsets.only(top: 12.0),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0),
      decoration: new BoxDecoration(
        color: Color(0xffffffff),
        border: new Border(
          bottom: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
          top: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
        ),
      ),
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(
            height: 40.0,
            child: new Row(
              children: <Widget>[
                new Text(
                  '商品规格',
                  style: new TextStyle(
                    color: Color(0xff333333),
                    fontSize: 14.0,
                  ),
                ),
              ],
            )
          ),
          new Container(
            child: new Wrap(
              children: _widgetSpecsGroup(),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _widgetSpecsGroup () {
    List<Widget> list = [];
    String goodsNorms = widget?.data?.goodsNorms;
    if (goodsNorms == null) return list;
    List<String> stringList = goodsNorms.split(',');
    stringList.forEach((item) {
      list.add(_specsButtonSection(text: item ?? '', index: list.length));
    });
    return list;
  }

  Widget _specsButtonSection ({String text = '', int index}) {
    return new Container(
      height: 30.0,
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        border: new Border.all(
          color: index == _index ? Color(0xffef2c2c) : Color(0xffdddddd),
          width: 0.5,
        ),
      ),
      margin: const EdgeInsets.only(right: 10.0, bottom: 10.0),
      child: new FlatButton(
        onPressed: () {this.setState(() { _index = index; });},
        padding: const EdgeInsets.only(left: 10.0, right: 10.0),
        child: new Text(
          text,
          style: new TextStyle(
            color: index == _index ? Color(0xffef2c2c) : Color(0xffdddddd),
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }
}