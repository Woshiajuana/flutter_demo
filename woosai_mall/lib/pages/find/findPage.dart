
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:woosai_mall/components/goodsItem.dart';

class FindPage extends StatefulWidget {

  @override
  _FindPageState createState() => new _FindPageState();
}

class _FindPageState extends State<FindPage> {

  RefreshController _refreshController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _refreshController = RefreshController(initialRefresh:true);
  }

  void _onRefresh(){
    print('刷新');
    _refreshController.refreshCompleted();
  }

  void _onLoading(){
    print('加载');
    _refreshController.refreshCompleted();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _refreshController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('商品列表'),
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullUp: true,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: new ListView(
          children: <Widget>[
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
            new GoodsItem(),
          ],
        ),
      ),
    );
  }
}