
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:woosai_mall/common/application.dart';
import 'package:woosai_mall/models/goodsList.modal.dart';
import 'package:woosai_mall/models/goodsItem.modal.dart';
import 'package:woosai_mall/components/wowView.dart';

class FindPage extends StatefulWidget {

  @override
  _FindPageState createState() => new _FindPageState();
}

class _FindPageState extends State<FindPage> with AutomaticKeepAliveClientMixin { // 要点1

  ScrollController _scrollController;
  List<GoodsItemModal> _arrData;
  int _pageNum = 1;
  int _lastPage;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _refreshData();
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

  @override
  void dispose() {
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true; // 要点2

  @override
  Widget build(BuildContext context) {
    super.build(context); // 要点3
    return Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: new AppBar(
        title: new Text('商品列表'),
      ),
      body: new WowView(
        isLoading: _isLoading,
        child: new RefreshIndicator(
          onRefresh: _refreshData,
          child: StaggeredGridView.countBuilder(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            controller: _scrollController,
            itemCount: _arrData?.length ?? 0,
            primary: false,
            crossAxisCount: 4,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            itemBuilder: (context, index) =>_widgetGoodsItem(index),
            staggeredTileBuilder: (index) => StaggeredTile.fit(2),
          ),
        ),
      ),
    );
  }

  Future _refreshData () async {
    print('下拉刷新');
    _pageNum = 1;
    _reqGoodsList();
  }

  Future _reqGoodsList () async {
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

  Widget _widgetGoodsItem (index) {
    GoodsItemModal goodsItemModal = _arrData[index];
    return new InkWell(
      onTap: () => Application.router.push(context, 'details', params: {'goodsId': goodsItemModal.id }),
      child: new Container(
        decoration: new BoxDecoration(
          color: Colors.white,
          borderRadius: new BorderRadius.circular(5.0),
          border: new Border.all(
            color: Color(0xffdddddd),
            width: 0.5,
          )
        ),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Container(
              child: new ClipRRect(
                borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                ),
                child: new Center(
                  child: new FadeInImage.assetNetwork(
                    placeholder: Application.config.style.srcGoodsNull,
                    image: _formatImage(goodsItemModal),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            new Container(
              padding: const EdgeInsets.only(top: 3.0, left: 5.0, right: 5.0),
              child: new Text(
                goodsItemModal?.goodsName ?? '',
                style: new TextStyle(
                  color: Color(0xff333333),
                  fontSize: 14.0,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            new Container(
              padding: const EdgeInsets.only(top: 3.0,left: 5.0, right: 5.0, bottom: 3.0),
              child: new Text(
                goodsItemModal?.goodsDetails ?? '',
                style: new TextStyle(
                  color: Color(0xff999999),
                  fontSize: 10.0,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            _widgetDiscount(goodsItemModal),
            _widgetPrice(goodsItemModal),
          ],
        ),
      ),
    );
  }

  Widget _widgetPrice (GoodsItemModal goodsItemModal) {
    int goodsPrice = goodsItemModal?.goodsPrice ?? 0;
    int goodsDiscountPrice = goodsItemModal?.goodsDiscountPrice ?? 0;
    return new Container(
      padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
      child: new Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          new Container(
            child: new Text(
              '￥',
              style: new TextStyle(
                color: Colors.red,
                fontSize: 10.0,
              ),
            ),
          ),
          new Container(
            child: new Text(
              '${_formatAmount(goodsDiscountPrice)}',
              style: new TextStyle(
                color: Colors.red,
                fontSize: 16.0,
              ),
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(left: 8.0),
            child: new Text(
              '￥${_formatAmount(goodsPrice)}',
              style: new TextStyle(
                color: Color(0xff999999),
                fontSize: 10.0,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetDiscount (GoodsItemModal goodsItemModal) {
    int discountPoints = goodsItemModal?.discountPoints ?? 0;
    return new Container(
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
      child: new Wrap(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(2.0),
                border: new Border.all(
                  color: Colors.red,
                  width: 0.5,
                )
            ),
            padding: const EdgeInsets.only(left: 3.0, right: 3.0),
            margin: const EdgeInsets.only(right: 8.0, top: 5.0),
            child: new Text(
              '包邮',
              style: new TextStyle(
                color: Colors.red,
                fontSize: 10.0,
              ),
            ),
          ),
          discountPoints == 0 ? new Container() : new Container(
            decoration: new BoxDecoration(
                borderRadius: new BorderRadius.circular(2.0),
                border: new Border.all(
                  color: Colors.red,
                  width: 0.5,
                )
            ),
            padding: const EdgeInsets.only(left: 3.0, right: 3.0),
            margin: const EdgeInsets.only(right: 8.0, top: 5.0),
            child: new Text(
              '$discountPoints积分可减$discountPoints元',
              style: new TextStyle(
                color: Colors.red,
                fontSize: 10.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  String _formatAmount (int data) {
    double amount = data / 100;
    return amount?.toString() ?? '--';
  }

  String _formatImage (GoodsItemModal goodsItemModal) {
    if (goodsItemModal == null) return '';
    String thumbnailPath = goodsItemModal.thumbnailPath;
    return thumbnailPath.split(',')[0];
  }
}