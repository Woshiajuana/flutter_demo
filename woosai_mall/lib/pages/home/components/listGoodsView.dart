
import 'package:flutter/material.dart';
import 'package:woosai_mall/components/goodsItem.dart';
import 'package:woosai_mall/models/goodsItem.modal.dart';
import 'package:woosai_mall/application.dart';

class ListGoodsView extends StatefulWidget {

  const ListGoodsView({
    this.data,
    this.title,
  });

  final List<GoodsItemModal> data;
  final String title;

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
                new Text(widget.title, style: TextStyle(fontSize: 16.0),),
                new Expanded(
                  flex: 1,
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      new GestureDetector(
                        onTap: () => Application.router.push(context, 'list'),
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
          new Column(
            children: _getWidgetList(widget.data),
          ),
        ],
      ),
    );
  }

  List<Widget> _getWidgetList(List data) {
    List<GoodsItem> list = [];
    if (data != null) {
      data.forEach((item) {
        list.add(new GoodsItem(data: item));
      });
    }
    return list;
  }


}