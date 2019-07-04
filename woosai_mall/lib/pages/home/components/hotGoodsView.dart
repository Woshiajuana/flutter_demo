
import 'package:flutter/material.dart';

class HotGoodsView extends StatefulWidget {

  @override
  _HotGoodsViewState createState() => new _HotGoodsViewState();
}

class _HotGoodsViewState extends State<HotGoodsView> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border.all(color: Color(0xffdddddd), width: 0.5)
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(top: 16.0, bottom: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: 5,
                  height: 20,
                  color: Color(0xff1296db),
                  margin: const EdgeInsets.only(right: 5.0),
                ),
                new Text('热门商品', style: TextStyle(fontSize: 16.0),),
              ],
            ),
          ),
          new Column(
            children: <Widget>[
              new Row(
                children: <Widget>[
                  new Expanded(
                    flex: 1,
                    child: new Card(
                      color: Color(0xff1296db),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                      child: new Container(
                        height: 120.0,
                      ),
                    ),
                  ),
                  new Expanded(
                    flex: 1,
                    child: new Card(
                      color: Color(0xff1296db),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                      child: new Container(
                        height: 120.0,
                      ),
                    ),
                  ),
                ],
              ),
              new Row(
                children: <Widget>[
                  new Expanded(
                    flex: 1,
                    child: new Card(
                      color: Color(0xff1296db),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                      child: new Container(
                        height: 120.0,
                      ),
                    ),
                  ),
                  new Expanded(
                    flex: 1,
                    child: new Card(
                      color: Color(0xff1296db),
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(14.0))),
                      child: new Container(
                        height: 120.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
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