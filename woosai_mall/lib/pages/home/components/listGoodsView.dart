
import 'package:flutter/material.dart';
import 'package:woosai_mall/components/goodsItem.dart';
import 'package:woosai_mall/pages/list/listPage.dart';

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
                        onTap: _handleJump,
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
  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(1.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child,
    );
  }
  _handleJump () {
    print('点击了我');
//    Navigator.of(context).pushNamed('list');

//    Navigator
//        .of(context)
//        .push(new MaterialPageRoute(builder: (_) {
//      return new ListPage();
//    }));

    BRouter.pushRefreshDetail(context);
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

class BRouter {
  static void pushRefreshDetail(BuildContext context) {

    Navigator.of(context).push(new PageRouteBuilder(pageBuilder:
        (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return new ListPage();
    }, transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) {
      // 添加一个平移动画
      return BRouter.createTransition(animation, child);
    }));
  }

  /// 创建一个平移变换
  /// 跳转过去查看源代码，可以看到有各种各样定义好的变换
  static SlideTransition createTransition(
      Animation<double> animation, Widget child) {
    return new SlideTransition(
      position: new Tween<Offset>(
        begin: const Offset(2.0, 0.0),
        end: const Offset(0.0, 0.0),
      ).animate(animation),
      child: child, // child is the value returned by pageBuilder
    );
  }
}