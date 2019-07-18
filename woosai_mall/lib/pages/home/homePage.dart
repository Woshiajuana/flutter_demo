
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/home/components/headView.dart';
import 'package:woosai_mall/pages/home/components/carouselView.dart';
import 'package:woosai_mall/pages/home/components/hotGoodsView.dart';
import 'package:woosai_mall/pages/home/components/listGoodsView.dart';
import 'package:woosai_mall/common/utils/apiUtil.dart';
import 'package:woosai_mall/common/model/hotRecommendModal.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  HotRecommendModal hotRecommendModal;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();

    _handleRefresh();
  }

  @override
  Widget build(BuildContext context) {
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
                child: new ListView(
                  children: <Widget>[
                    new CarouselView(),
                    new HotGoodsView(
                      title: '抢购商品',
                      data: hotRecommendModal?.hotGoodsInfoList,
                    ),
                    new HotGoodsView(
                      title: '热门商品',
                      data: hotRecommendModal?.recomGoodsInfoList,
                    ),
                    new ListGoodsView(
                      title: '商品列表',
                      data: hotRecommendModal?.goodsInfoList,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void>  _handleRefresh () async {
    if (!mounted) return;
    hotRecommendModal = await ApiUtil.reqHotAndRecommendGoods();
    this.setState(() {
      hotRecommendModal = hotRecommendModal;
    });
    print('hotRecommendModal => $hotRecommendModal');
  }

}
