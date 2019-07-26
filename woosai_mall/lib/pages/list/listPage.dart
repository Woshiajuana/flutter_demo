
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

  List<GoodsItemModal> _arrData;
  int _pageNum = 1;
  int _lastPage;
  bool _isLoading;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _onRefresh();
  }

  Future _onRefresh () async{
    print('刷新');
    _pageNum = 1;
    _reqGoodsList();
  }


  @override
  void dispose() {
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
          onRefresh: () => _onRefresh(),
          child: new ListView.builder(
            itemCount: _arrData?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              GoodsItemModal goodsItemModal = _arrData[index];
              return new GoodsItem(data: goodsItemModal);
            },
          ),
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