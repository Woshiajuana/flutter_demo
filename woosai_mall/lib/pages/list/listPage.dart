
import 'package:flutter/material.dart';
import 'package:woosai_mall/components/goodsItem.dart';
import 'package:woosai_mall/common/application.dart';
import 'package:woosai_mall/models/goodsList.modal.dart';
import 'package:woosai_mall/models/goodsItem.modal.dart';
import 'package:woosai_mall/components/wowView.dart';

class ListPage extends StatefulWidget {

  @override
  _ListPageState createState() => new _ListPageState();
}

class _ListPageState extends State<ListPage> {

  ScrollController _scrollController;
  List<GoodsItemModal> _arrData;
  int _pageNum = 1;
  int _lastPage;
  bool _isLoading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleRefresh();
    _scrollController = new ScrollController();
    // 首次拉取数据
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('我监听到底部了!');
        if (_lastPage != null && _pageNum >= _lastPage) return;
        _pageNum++;
        _reqGoodsList();
      }
    });
  }

  Future _handleRefresh () async{
    print('刷新');
    _pageNum = 1;
    _reqGoodsList();
  }


  @override
  void dispose() {
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('商品列表'),
      ),
      body: new WowView(
        isLoading: _isLoading,
        child: new RefreshIndicator(
          onRefresh: () => _handleRefresh(),
          child: new ListView.builder(
            controller: _scrollController,
            itemCount: _arrData == null ? 0 : _arrData.length + 1,
            itemBuilder: _widgetItemBuilder,
          ),
        ),
      ),
    );
  }

  Widget _widgetItemBuilder (BuildContext context, int index) {
    if (index < _arrData.length) {
      GoodsItemModal goodsItemModal = _arrData[index];
      return new GoodsItem(data: goodsItemModal);
    }
    if (_pageNum >= _lastPage) {
      return new Container(
        height: 50.0,
        child: new Center(
          child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Container(
                color: Color(0xffdddddd),
                width: 80.0,
                height: 0.5,
              ),
              new Container(
                margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: new Text(
                  '没有更多了',
                  style: new TextStyle(
                    color: Color(0xff999999),
                    fontSize: 12.0,
                  ),
                ),
              ),
              new Container(
                color: Color(0xffdddddd),
                width: 80.0,
                height: 0.5,
              ),
            ],
          ),
        ),
      );
    }
    return new Container(
      height: 50.0,
      child: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 16.0,
              height: 16.0,
              margin: const EdgeInsets.only(right: 10.0),
              child: new CircularProgressIndicator(
                strokeWidth: 1.0,
              ),
            ),
            new Text(
              '加载中...',
              style: new TextStyle(
                color: Colors.blue,
                fontSize: 12.0,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _reqGoodsList () async {
    try {
      GoodsListModal _goodsListModal = await Application.service.goods.reqGoodsList(
        pageNum: _pageNum,
      );
      if (_pageNum == 1) {
        _arrData = _goodsListModal?.list ?? [];
      } else {
        _arrData.addAll(_goodsListModal?.list ?? []);
      }
      _lastPage = _goodsListModal?.lastPage ?? 0;
    } catch (err) {
      Application.util.modal.toast(err);
    } finally {
      this.setState(() { _isLoading = false; });
    }
  }
}