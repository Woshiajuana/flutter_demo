
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/details/components/carouselView.dart';
import 'package:woosai_mall/pages/details/components/operationView.dart';
import 'package:woosai_mall/pages/details/components/baseInfoView.dart';
import 'package:woosai_mall/pages/details/components/specsGroupView.dart';
import 'package:woosai_mall/pages/details/components/detailsGroupView.dart';
import 'package:woosai_mall/common/model/goodsDetailsModal.dart';
import 'package:woosai_mall/common/utils/apiUtil.dart';

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

  GoodsDetailsModal goodsDetailsModal;

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
      body: new RefreshIndicator(
        onRefresh: _handleRefresh,
        child: new Container(
          color: Color(0xfff2f2f2),
          child: new Column(
            children: <Widget>[
              new Expanded(
                child: new ListView(
                  children: <Widget>[
                    new CarouselView(),
                    new BaseInfoView(),
                    new SpecsGroupView(),
                    new DetailsGroupView(),
                  ],
                ),
              ),
              new OperationView(),
            ],
          ),
        ),
      ),
    );
  }

  Future<void>  _handleRefresh () async {
    if (!mounted) return;
    goodsDetailsModal = await ApiUtil.reqGoodsDetails(widget.goodsId);
    this.setState(() {
      goodsDetailsModal = goodsDetailsModal;
    });
    print('goodsDetailsModal => $goodsDetailsModal');
  }

}