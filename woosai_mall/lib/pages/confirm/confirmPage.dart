
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/confirm/components/addressView.dart';
import 'package:woosai_mall/pages/confirm/components/goodsView.dart';
import 'package:woosai_mall/pages/confirm/components/previewGroupView.dart';
import 'package:woosai_mall/pages/confirm/components/operationGroupView.dart';
import 'package:woosai_mall/common/utils/routerUtil.dart';
import 'package:woosai_mall/models/goodsDetails.modal.dart';
import 'package:woosai_mall/models/addressItem.model.dart';
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
  AddressItemModal _addressItemModal;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _reqGoodsDetails();
    _reqAddressList();
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
            new AddressView(
              data: _addressItemModal,
              onTap: () => _handleAddress(),
            ),
            new GoodsView(
              data: _goodsDetailsModal?.goodsInfo,
              list: _goodsDetailsModal?.fileList,
            ),
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

  Future _handleAddress () async {
    AddressItemModal result = await RouterUtil.pushAddress(context, from: 'confirm');
    if (result == null) return;
    this.setState(() { _addressItemModal = result; });
  }

  Future<void>  _reqGoodsDetails () async {
    try {
      _goodsDetailsModal = await Application.service.goods.reqGoodsDetails(goodsId: widget.goodsId);
    } catch (err) {
      Application.util.modal.toast(err);
    } finally {
      this.setState(() {});
    }
  }

  Future _reqAddressList () async {
    try {
      List<AddressItemModal> _arrData = await Application.service.address.reqAddressList();
      _arrData.forEach((item) {
        if (item.isDefault == 'normal') {
          _addressItemModal = item;
        }
      });
    } catch (err) {
      Application.util.modal.toast(err);
    } finally {
      this.setState(() {});
    }
  }
}