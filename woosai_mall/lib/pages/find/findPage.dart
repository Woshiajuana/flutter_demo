
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class FindPage extends StatefulWidget {

  @override
  _FindPageState createState() => new _FindPageState();
}

class _FindPageState extends State<FindPage> with AutomaticKeepAliveClientMixin {

  ScrollController _scrollController = new ScrollController();


  int _page = 0;
  int _size = 10;
  int _beLoad = 0; // 0表示不显示, 1表示正在请求, 2表示没有更多数据

  var posts;

  @override
  void initState() {
    super.initState();
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
  Widget build(BuildContext context) {
    posts = [1.0, 2.0, 3.0, 2.0, 3.0, 2.0, 3.0, 2.0, 3.0, 3.0, 2.0, 3.0, 2.0];
    return Scaffold(
      appBar: new AppBar(
        title: new Text('商品列表'),
      ),
      body: RefreshIndicator(
        onRefresh: _refreshData,
        child: Container(
          color: Color(0xfff2f2f2),
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: StaggeredGridView.countBuilder(
            controller: _scrollController,
            itemCount: posts.length,
            primary: false,
            crossAxisCount: 4,
            mainAxisSpacing: 8.0,
            crossAxisSpacing: 8.0,
            itemBuilder: (context, index) =>_goodsItem(index),
            staggeredTileBuilder: (index) => StaggeredTile.fit(2),
          ),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

  Future<Null> _refreshData() async {
    print('下拉刷新');
//    _page = 0;
//    _getPostData(false);
  }

  Widget _goodsItem (height) {
    return new Container(
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: new BorderRadius.circular(5.0),
        border: new Border.all(
          color: Color(0xffdddddd),
          width: 0.5,
        )
      ),
      child: new Column(
        children: <Widget>[
          new Container(
            height: height * 10.0 + 50.0,
            child: new ClipRRect(
              borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(5.0),
                topRight: Radius.circular(5.0),
              ),
              child: new Image.network(
                'http://mall-h5.dev.ptjxd.com/assets/images/index-banner.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(top: 3.0, left: 5.0, right: 5.0),
            child: new Text(
              'AOC 25英寸大屏 4K高清广角AOC 25英寸大屏 4K高清 IPS广角',
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
              'AOC 25英寸大屏 4K高清广角AOC 25英寸大屏 4K高清 IPS广角',
              style: new TextStyle(
                color: Color(0xff999999),
                fontSize: 10.0,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          new Container(
            padding: const EdgeInsets.only(top: 5.0, left: 5.0, right: 5.0, bottom: 3.0),
            child: new Wrap(
              crossAxisAlignment: WrapCrossAlignment.start,
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
            padding: const EdgeInsets.only(top: 0, left: 5.0, right: 5.0, bottom: 5.0),
            child: new Row(
              children: <Widget>[
                new Container(
                  child: new Text(
                    '￥198.88',
                    style: new TextStyle(
                      color: Colors.red,
                      fontSize: 16.0,
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}