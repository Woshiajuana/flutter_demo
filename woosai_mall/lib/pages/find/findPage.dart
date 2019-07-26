
import 'package:flutter/material.dart';
import 'package:woosai_mall/common/utils/routerUtil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:woosai_mall/application.dart';
import 'package:woosai_mall/models/goodsList.modal.dart';
import 'package:woosai_mall/models/goodsItem.modal.dart';
import 'package:woosai_mall/components/wowView.dart';

class FindPage extends StatefulWidget {

  @override
  _FindPageState createState() => new _FindPageState();
}

class _FindPageState extends State<FindPage> with AutomaticKeepAliveClientMixin { // 要点1

  ScrollController _scrollController = new ScrollController();
  GoodsListModal _goodsListModal;
  int _pageNum = 1;
  var posts;

  @override
  void initState() {
    super.initState();
    _refreshData();
    // 首次拉取数据
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
//        _addMoreData();
        print('我监听到底部了!');
      }
    });
  }

  @override
  bool get wantKeepAlive => true; // 要点2

  @override
  Widget build(BuildContext context) {
    super.build(context); // 要点3
    return Scaffold(
      appBar: new AppBar(
        title: new Text('商品列表'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Container(
          color: Color(0xfff2f2f2),
          child: StaggeredGridView.countBuilder(
            padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
            controller: _scrollController,
            itemCount: _goodsListModal?.list?.length ?? 0,
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
      _goodsListModal = await Application.service.goods.reqGoodsList(
        pageNum: _pageNum,
      );
      this.setState(() {});
    } catch (err) {
      Application.util.modal.toast(err);
    }
  }

  Widget _widgetGoodsItem (index) {
    GoodsItemModal goodsItemModal = _goodsListModal.list[index];
    return new InkWell(
      onTap: () => RouterUtil.pushDetails(context),
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
//              height: index * 10.0 + 50.0,
              child: new ClipRRect(
                borderRadius: new BorderRadius.only(
                  topLeft: Radius.circular(5.0),
                  topRight: Radius.circular(5.0),
                ),
                child: new Center(
                  child: new Image.network(
                    _formatImage(goodsItemModal),
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
            new Container(
              padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0),
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
                    margin: const EdgeInsets.only(right: 8.0),
                    child: new Text(
                      '包邮',
                      style: new TextStyle(
                        color: Colors.red,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                  new Container(
                    decoration: new BoxDecoration(
                        borderRadius: new BorderRadius.circular(2.0),
                        border: new Border.all(
                          color: Colors.red,
                          width: 0.5,
                        )
                    ),
                    padding: const EdgeInsets.only(left: 3.0, right: 3.0),
                    child: new Text(
                      '99积分可减99元',
                      style: new TextStyle(
                        color: Colors.red,
                        fontSize: 10.0,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            new Container(
              padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 5.0),
              child: new Row(
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
                      '198.88',
                      style: new TextStyle(
                        color: Colors.red,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                  new Container(
                    margin: const EdgeInsets.only(left: 8.0),
                    child: new Text(
                      '￥298.88',
                      style: new TextStyle(
                        color: Color(0xff999999),
                        fontSize: 10.0,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatImage (GoodsItemModal goodsItemModal) {
    if (goodsItemModal == null) return '';
    String thumbnailPath = goodsItemModal.thumbnailPath;
    return thumbnailPath.split(',')[0];
  }
}