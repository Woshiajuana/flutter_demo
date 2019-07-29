
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/application.dart';
import 'package:woosai_mall/components/wowView.dart';
import 'package:woosai_mall/models/orderList.model.dart';
import 'package:woosai_mall/models/orderItem.modal.dart';

class OrderPage extends StatefulWidget {

  @override
  OrderPageState createState() => new OrderPageState();
}

class OrderPageState extends State<OrderPage> {

  ScrollController _scrollController;
  List<OrderItemModal> _arrData;
  int _pageNum = 1;
  int _lastPage;
  bool _isLoading;
  Map _orderStatus = {
    '1': '待支付',
    '2': '订单关闭',
    '3': '待发货',
    '4': '支付失败',
    '5': '已发货',
  };

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        title: new Text('我的订单'),
      ),
      body: new WowView(
        isLoading: _isLoading,
        child: new RefreshIndicator(
          onRefresh: _handleRefresh,
          child: new ListView.builder(
            controller: _scrollController,
            itemCount: _arrData == null ? 0 : _arrData.length + 1,
            itemBuilder: _widgetItemBuilder,
          ),
        ),
      ),
    );
  }

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
        reqOrderList();
      }
    });
  }

  Future _handleRefresh () async{
    print('刷新');
    _pageNum = 1;
    reqOrderList();
  }

  void reqOrderList () async {
    try {
      OrderListModal orderListModal = await Application.service.order.reqOrderList(
        pageNum: _pageNum,
      );
      if (_pageNum == 1) {
        _arrData = orderListModal?.list ?? [];
      } else {
        _arrData.addAll(orderListModal?.list ?? []);
      }
      _lastPage = orderListModal?.lastPage ?? 0;
    } catch (err) {
      Application.util.modal.toast(err);
    } finally {
      this.setState(() { _isLoading = false; });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  Widget _widgetItemBuilder (BuildContext context, int index) {
    if (index < _arrData.length) {
      return _widgetOrderCellItem(index);
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

  Widget _widgetOrderCellItem (int index) {
    OrderItemModal orderItemModal = _arrData[index];
    return new Container(
      margin: const EdgeInsets.only(top: 20.0),
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      color: Color(0xfff2f2f2),
      child: new Column(
        children: <Widget>[
          _widgetOrderGoods(orderItemModal),
          new Container(
            padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
            decoration: new BoxDecoration(
              border: new Border(
                top: new BorderSide(
                  color: Color(0xffdddddd),
                  width: 0.5,
                ),
              ),
            ),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Text(
                  _orderStatus[orderItemModal?.orderStatus ?? '1'],
                  style: new TextStyle(
                    fontSize: 13.0,
                    color: Color(0xff333333),
                  ),
                ),
                new Container(
                  height: 30.0,
                  decoration: new BoxDecoration(
                    border: Border.all(
                      color: Color(0xff333333),
                      width: 0.5,
                    ),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: new FlatButton(
                    onPressed: () => Application.router.push(context, 'orderDetails', params: {'orderNo': orderItemModal?.orderNo}),
                    child: new Text(
                      '查看详情',
                      style: new TextStyle(
                        fontSize: 13.0,
                        color: Color(0xff333333),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _widgetOrderGoods (OrderItemModal orderItemModal) {
    return new Container(
      padding: const EdgeInsets.only(bottom: 16.0, top: 16.0),
      child: new Row(
        children: <Widget>[
          new Container(
            width: 80.0,
            height: 80.0,
            margin: const EdgeInsets.only(right: 16.0),
            decoration: new BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: new FadeInImage.assetNetwork(
                width: 80.0,
                height: 80.0,
                placeholder: Application.config.style.srcGoodsNull,
                image: _goodsImage(orderItemModal),
                fit: BoxFit.fill,
              ),
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Container(
              height: 80.0,
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Container(
                    child: new Text(
                      orderItemModal?.goodsName ?? '',
                      style: new TextStyle(
                        fontSize: 16.0,
                        color: Color(0xff333333),
                      ),
                    ),
                  ),
                  new Expanded(flex: 1, child: new Container()),
                  new Row(
                    children: <Widget>[
                      new Text(
                        '${_formatAmount(orderItemModal?.goodsDiscountPrice ?? 0)} * ${orderItemModal?.tradeBuyNum}',
                        style: new TextStyle(
                          fontSize: 13.0,
                          color: Color(0xff999999),
                        ),
                      ),
                      new Expanded(flex: 1, child: new Container()),
                      new Text(
                        '合计：',
                        style: new TextStyle(
                          fontSize: 13.0,
                          color: Color(0xff999999),
                        ),
                      ),
                      new Text(
                        _formatAmount(orderItemModal?.tradeAmt ?? 0),
                        style: new TextStyle(
                          fontSize: 13.0,
                          color: Color(0xff333333),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  String _goodsImage (OrderItemModal orderItemModal) {
    String thumbnailPath = orderItemModal?.thumbnailPath ?? '';
    return thumbnailPath.split(',')[0];
  }

  String _formatAmount (int data) {
    double amount = data / 100;
    return '￥' + amount?.toString() ?? '--';
  }

}