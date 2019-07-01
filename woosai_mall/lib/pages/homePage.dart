
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:woosai_mall/components/headView.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

  ScrollController _scrollViewController;
  GlobalKey _keyFilter = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollViewController = ScrollController(initialScrollOffset: 0.0);
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: PreferredSize(
        child: AppBar(
          brightness: Brightness.dark,
          elevation: 0,
        ),
        preferredSize: Size.fromHeight(0),
      ),
      body: Column(
        children: <Widget>[
          new HeadView(),
          Expanded(
            child: new NestedScrollView(
              controller: _scrollViewController,
              headerSliverBuilder: (BuildContext context, bool boxIsScrolled) {
                return <Widget> [
                  SliverAppBar(
                    pinned: true,
                    floating: true,
                    forceElevated: boxIsScrolled,
                    backgroundColor: Color.fromRGBO(241, 242, 241, 1),
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Column(
//                  key: _keyFilter,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new _CarouselView(),
                        ],
                      ),
                    ),
//                    expandedHeight: (_sizeRed == null ? ScreenUtil.screenHeight : _sizeRed.height) + 50.0,
                    bottom: PreferredSize(
                      preferredSize: Size(double.infinity, 46),
                      child: new Text('导航条'),
                    ),
                  ),
                ];
              },
              body: Column(
                children: <Widget>[
                  new Text('内容'),
                  new Text('内容'),
                  new Text('内容'),
                  new Text('内容'),
                  new Text('内容'),
                  new Text('内容'),
                  new Text('内容'),
                  new Text('内容'),
                  new Text('内容'),
                  new Text('内容'),
                  new Text('内容'),
                  new Text('内容'),
                  new Text('内容'),
                  new _CarouselView(),
                  new Text('内容'),
                  new Text('内容'),
                  new Text('内容'),
                  new _CarouselView(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CarouselView extends StatefulWidget {
  @override
  _CarouselViewState createState() => _CarouselViewState();
}

class _CarouselViewState extends State<_CarouselView> {

  // 声明一个list 存放image Widget
  List<Widget> imageList = List();

  @override
  void initState() {
    imageList
      ..add(Image.network(
        'https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=2726034926,4129010873&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=3485348007,2192172119&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ))
      ..add(Image.network(
        'https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=2594792439,969125047&fm=26&gp=0.jpg',
        fit: BoxFit.fill,
      ));
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: 200.0,
      child: Swiper(
        itemBuilder: _carouselBuilder,
        itemCount: 3,
        pagination: new SwiperPagination(
          builder: DotSwiperPaginationBuilder(
            color: Colors.black54,
            activeColor: Colors.white,
          ),
        ),
        controller: new SwiperController(),
        scrollDirection: Axis.horizontal,
        autoplay: true,
        onTap: (index) => print('点击了第$index个'),
      ),
    );
  }

  Widget _carouselBuilder(BuildContext context, int index) {
    return (imageList[index]);
  }
}
