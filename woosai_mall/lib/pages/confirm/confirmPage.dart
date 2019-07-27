
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/confirm/components/addressView.dart';
import 'package:woosai_mall/pages/confirm/components/goodsView.dart';
import 'package:woosai_mall/pages/confirm/components/previewGroupView.dart';
import 'package:woosai_mall/pages/confirm/components/operationGroupView.dart';
import 'package:woosai_mall/models/goodsDetails.modal.dart';
import 'package:woosai_mall/application.dart';

class ConfirmPage extends StatefulWidget {

  const ConfirmPage({
    Key key,
    this.goodsId,
    this.specs,
  }) : super(key: key);


  final int goodsId;
  final String specs;

  @override
  _ConfirmPageState createState() => new _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {

  GoodsDetailsModal _goodsDetailsModal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(
          '订单确认',
        ),
      ),
      body: new Container(
        child: new Column(
          children: <Widget>[
            new AddressView(),
            new GoodsView(),
            new Expanded(
              flex: 1,
              child: new PreviewGroupView(),
            ),
            new OperationGroupView(),
          ],
        ),
      ),
    );
  }

  Future<void>  _handleRefresh () async {
    try {
      _goodsDetailsModal = await Application.service.goods.reqGoodsDetails(goodsId: widget.goodsId);
    } catch (err) {
      Application.util.modal.toast(err);
    } finally {
      this.setState(() {});
    }
  }
}