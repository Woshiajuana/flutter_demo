
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/confirm/components/addressView.dart';
import 'package:woosai_mall/pages/confirm/components/goodsView.dart';
import 'package:woosai_mall/pages/confirm/components/previewGroupView.dart';
import 'package:woosai_mall/pages/confirm/components/operationGroupView.dart';

class ConfirmPage extends StatefulWidget {

  @override
  _ConfirmPageState createState() => new _ConfirmPageState();
}

class _ConfirmPageState extends State<ConfirmPage> {

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
}