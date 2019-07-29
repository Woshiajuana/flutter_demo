
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/details/components/carouselView.dart';
import 'package:woosai_mall/pages/details/components/operationView.dart';
import 'package:woosai_mall/pages/details/components/baseInfoView.dart';
import 'package:woosai_mall/pages/details/components/specsGroupView.dart';
import 'package:woosai_mall/pages/details/components/detailsGroupView.dart';
import 'package:woosai_mall/models/goodsDetails.modal.dart';
import 'package:woosai_mall/application.dart';
import 'package:woosai_mall/components/wowView.dart';

class DetailsPage extends StatefulWidget {

  const DetailsPage({
    Key key,
    this.goodsId,
  }) : super(key: key);

  final int goodsId;

  @override
  _DetailsPageState createState() => new _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {

  GoodsDetailsModal _goodsDetailsModal;
  bool _isLoading;
  String _specs;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (!mounted) return;
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('商品详情'),
      ),
      body: new WowView(
        isLoading: _isLoading,
        child: new RefreshIndicator(
          onRefresh: _handleRefresh,
          child: new Container(
            color: Color(0xfff2f2f2),
            child: new Column(
              children: <Widget>[
                new Expanded(
                  child: new ListView(
                    children: <Widget>[
                      new CarouselView(data: _goodsDetailsModal?.fileList),
                      new BaseInfoView(data: _goodsDetailsModal?.goodsInfo),
                      new SpecsGroupView(data: _goodsDetailsModal?.goodsInfo, onSelect: (text) => _specs = text,),
                      new DetailsGroupView(data: _goodsDetailsModal?.fileList),
                    ],
                  ),
                ),
                new OperationView(
                  data: _goodsDetailsModal?.goodsInfo,
                  customerPhone: _goodsDetailsModal?.customerPhone,
                  onJump: () => _handleJump(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleJump () {
    Application.router.push(context, 'confirm', params: {'goodsId': widget.goodsId, 'specs': _specs});
  }

  Future<void>  _handleRefresh () async {
    try {
      _goodsDetailsModal = await Application.service.goods.reqGoodsDetails(goodsId: widget.goodsId);
    } catch (err) {
      Application.util.modal.toast(err);
    } finally {
      this.setState(() {_isLoading = false;});
    }
  }

}