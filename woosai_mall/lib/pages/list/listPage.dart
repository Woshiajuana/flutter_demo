
import 'package:flutter/material.dart';
import 'package:woosai_mall/components/goodsItem.dart';
import 'package:woosai_mall/application.dart';
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
    GoodsItemModal goodsItemModal = _arrData[index];
    if (index < _arrData.length) {
      return new GoodsItem(data: goodsItemModal);
    }
    return new Container(
      height: 100.0,
      child: new Center(
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Container(
              width: 20.0,
              height: 20.0,
              margin: const EdgeInsets.only(right: 10.0),
              child: new CircularProgressIndicator(
                strokeWidth: 2.0,
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
        pageSize: 8,
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
      new Future.delayed(const Duration(seconds: 1), () {
        if (!mounted) return;
        this.setState(() { _isLoading = false; });
      });
    }
  }
}