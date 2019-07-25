
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/home/components/headView.dart';
import 'package:woosai_mall/pages/home/components/carouselView.dart';
import 'package:woosai_mall/pages/home/components/hotGoodsView.dart';
import 'package:woosai_mall/pages/home/components/listGoodsView.dart';
import 'package:woosai_mall/components/wowView.dart';
import 'package:woosai_mall/models/hotRecommend.model.dart';
import 'package:woosai_mall/application.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HotRecommendModal _hotRecommendModal;
  bool _isLoading;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
    Application.context = context;
    // TODO: implement build
    return new Scaffold(
      appBar: new PreferredSize(
        child: new AppBar(
          brightness: Brightness.dark,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: new RefreshIndicator(
        onRefresh: _handleRefresh,
        child: new Container(
          color: Color(0xfff2f2f2),
          child: new Column(
            children: <Widget>[
              new HeadView(),
              new Expanded(
                child: new WowView(
                  isLoading: _isLoading,
                  child: new ListView(
                    children: <Widget>[
                      new CarouselView(),
                      new HotGoodsView(
                        title: '抢购商品',
                        data: _hotRecommendModal?.hotGoodsInfoList,
                      ),
                      new HotGoodsView(
                        title: '热门商品',
                        data: _hotRecommendModal?.recomGoodsInfoList,
                      ),
                      new ListGoodsView(
                        title: '商品列表',
                        data: _hotRecommendModal?.goodsInfoList,
                      ),
                    ],
                  ),
                ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _handleRefresh () async {
    try {
      _hotRecommendModal = await Application.service.goods.reqHotAndRecommendGoods();
    } catch (err) {
      print('err=>$err');
      Application.util.modal.toast(err);
    } finally {
      new Future.delayed(const Duration(seconds: 1), () {
        this.setState(() { _isLoading = false; });
      });
    }
  }

}
