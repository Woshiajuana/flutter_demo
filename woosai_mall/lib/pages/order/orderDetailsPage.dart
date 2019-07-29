
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/application.dart';
import 'package:woosai_mall/models/orderItem.modal.dart';
import 'package:woosai_mall/components/wowView.dart';

class OrderDetailsPage extends StatefulWidget {

  const OrderDetailsPage ({
    Key key,
    this.orderNo,
  }) : super(key: key);

  final String orderNo;

  @override
  OrderDetailsPageState createState() => new OrderDetailsPageState();
}

class OrderDetailsPageState extends State<OrderDetailsPage> {

  OrderItemModal _orderItemModal;
  bool _isLoading;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Color(0xfff2f2f2),
      appBar: new AppBar(
        title: new Text('订单详情'),
      ),
      body: new WowView(
        isLoading: _isLoading,
        child: new ListView(
          children: <Widget>[
            _widgetWaybillSection(),
            _widgetAddressSection(),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _reqOrderDetails();
  }

  Widget _widgetWaybillSection () {
    return new Container(
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          top: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
          bottom: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
        ),
      ),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Icon(
            Icons.departure_board,
            size: 24.0,
            color: Color(0xffef2c2c),
          ),
          new Expanded(
            flex: 1,
            child: new Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    '暂无运单信息',
                    style: new TextStyle(
                      color: Color(0xff333333),
                      fontSize: 14.0,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetAddressSection () {
    return new Container(
      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 10.0, bottom: 10.0),
      decoration: new BoxDecoration(
        color: Colors.white,
        border: new Border(
          bottom: new BorderSide(
            color: Color(0xffdddddd),
            width: 0.5,
          ),
        ),
      ),
      child: new Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Icon(
            Icons.location_on,
            size: 24.0,
            color: Color(0xffef2c2c),
          ),
          new Expanded(
            flex: 1,
            child: new Container(
              margin: const EdgeInsets.only(left: 10.0),
              child: new Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(
                    '暂无运单信息暂无运单信息暂无运单信息暂无运单信息暂无运单信息暂无运单信息暂无运单信息',
                    style: new TextStyle(
                      color: Color(0xff333333),
                      fontSize: 16.0,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  new Text(
                    '暂无运单信息',
                    style: new TextStyle(
                      color: Color(0xff999999),
                      fontSize: 14.0,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _widgetGoodsSection () {
    return new Container(
      child: new Container(
        child: new Column(
          children: <Widget>[
            new Row(
              children: <Widget>[

              ],
            )
          ],
        ),
      ),
    );
  }

  void _reqOrderDetails () async {
    try {
      _orderItemModal = await Application.service.order.reqOrderDetails(
        orderNo: widget?.orderNo,
      );
    } catch (err) {
      Application.util.modal.toast(err);
    } finally {
      this.setState(() { _isLoading = false; });
    }
  }
}