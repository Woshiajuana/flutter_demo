
import 'package:flutter/material.dart';
//import 'package:vector_math/vector_math_64.dart';

import 'package:vector_math/vector_math_64.dart' as Vector;
class GoodsView extends StatefulWidget {

  @override
  _GoodsViewState createState() => new _GoodsViewState();
}

class _GoodsViewState extends State<GoodsView> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border.all(color: Color(0xffdddddd), width: 0.5)
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(top: 16.0, bottom: 16.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: 5,
                  height: 20,
                  color: Color(0xffef2c2c),
                  margin: const EdgeInsets.only(right: 5.0),
                ),
                new Text('热门商品', style: TextStyle(fontSize: 16.0),),
              ],
            ),
          ),
          new Container(
            child: new Row(
              children: <Widget>[
                new Card(
                  elevation: 0,
                  child: new Container(
                    width: 120.0,
                    height: 120.0,
                    color: Colors.red,
                  ),
                ),
                new Card(
                  child: new Container(
                    width: 120.0,
                    height: 120.0,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }


  List<String> getDataList() {
    List<String> list = [];
    for (int i = 0; i < 100; i++) {
      list.add(i.toString());
    }
    return list;
  }

  List<Widget> getWidgetList() {
    return getDataList().map((item) => getItemContainer(item)).toList();
  }

  Widget getItemContainer(String item) {
    return Container(
      alignment: Alignment.center,
      child: Text(
        item,
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
      color: Colors.blue,
    );
  }

}