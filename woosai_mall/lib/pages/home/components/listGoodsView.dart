
import 'package:flutter/material.dart';
import 'package:woosai_mall/components/goodsItem.dart';
//import 'package:woosai_mall/pages/list/listPage.dart';
import 'package:woosai_mall/common/utils/routerUtil.dart';

class ListGoodsView extends StatefulWidget {

  @override
  _ListGoodsViewState createState() => new _ListGoodsViewState();
}

class _ListGoodsViewState extends State<ListGoodsView> {

  @override
  Widget build(BuildContext context) {
    return new Container(
      margin: const EdgeInsets.only(top: 10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border.all(color: Color(0xffdddddd), width: 0.5)
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            padding: const EdgeInsets.only(left: 10.0, right: 10.0, top: 16.0, bottom: 10.0),
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new Container(
                  width: 5,
                  height: 20,
                  color: Color(0xff1296db),
                  margin: const EdgeInsets.only(right: 5.0),
                ),
                new Text('商品列表', style: TextStyle(fontSize: 16.0),),
                new Expanded(
                  flex: 1,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () => RouterUtil.pushList(context),
                        child: new Text(
                          '更多>>',
                          style: TextStyle(
                            color: Color(0xffEF2C2C),
                            fontSize: 16.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          new GoodsItem(),
          new GoodsItem(),
          new GoodsItem(),
          new GoodsItem(),
          new GoodsItem(),
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