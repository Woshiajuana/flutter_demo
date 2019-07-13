
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:woosai_mall/pages/home/homePage.dart';
import 'package:woosai_mall/pages/findPage.dart';
import 'package:woosai_mall/pages/cartPage.dart';
import 'package:woosai_mall/pages/mine/minePage.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => new _AppPageState();
}

class _AppPageState extends State<AppPage> with SingleTickerProviderStateMixin {

  // Tab页的控制器，可以用来定义Tab标签和内容页的坐标
  TabController tabController;
  var tabImages;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(
        length: 4, // Tab页的个数
        vsync: this, // 动画效果的异步处理，默认格式
    );
  }

  // 生命周期方法构建Widget时调用
  @override
  Widget build(BuildContext context) {
    initData();
    return new Scaffold(
//      body: new TabBarView(
//        controller: tabController,
//        physics: new NeverScrollableScrollPhysics(),
//        children: <Widget>[
//          new HomePage(),
//          new HomePage(),
//          new HomePage(),
//          new HomePage(),
//        ],
//      ),
      body: IndexedStack(
        index: tabIndex,
        children: <Widget>[
          new HomePage(),
          new FindPage(),
          new CartPage(),
          new MinePage(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        elevation: 0.0,
        child: new TabBar(
          indicatorColor: Colors.white,
          controller: tabController,
          tabs: <Tab>[
            new Tab(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  getTabIcon(0),
                  new Text('首页', style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
            new Tab(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  getTabIcon(1),
                  new Text('发现', style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
            new Tab(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  getTabIcon(2),
                  new Text('购物车', style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
            new Tab(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  getTabIcon(3),
                  new Text('我的', style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
          ],
          labelColor: Color(0xff1296db),
          unselectedLabelColor: Color(0xff999999),
          onTap: (index) {
            setState(() {
              tabIndex = index;
            });
          },
        ),
      ),
    );
  }

  // 组件即将销毁时调用
  @override
  void dispose() {
    // 释放内存，节省开销
    tabController.dispose();
    super.dispose();
  }

  Image getTabImage(path) {
    return new Image.asset(path, width: 20.0, height: 20.0,fit: BoxFit.fill,);
  }

  Image getTabIcon(int curIndex) {
    if (curIndex == tabIndex) {
      return tabImages[curIndex][1];
    }
    return tabImages[curIndex][0];
  }

  void initData(){
    tabImages = [
      [
        getTabImage('assets/images/app-home-icon.png'),
        getTabImage('assets/images/app-home-active-icon.png'),
      ],
      [
        getTabImage('assets/images/app-find-icon.png'),
        getTabImage('assets/images/app-find-active-icon.png'),
      ],
      [
        getTabImage('assets/images/app-cart-icon.png'),
        getTabImage('assets/images/app-cart-active-icon.png'),
      ],
      [
        getTabImage('assets/images/app-mine-icon.png'),
        getTabImage('assets/images/app-mine-active-icon.png'),
      ],
    ];
  }

  // 监听安卓的返回键操作
  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(
        title: new Text('退出App?'),
        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(onPressed: () => Navigator.of(context).pop(false), child: new Text('不')),
          new FlatButton(onPressed: () async { await pop(); }, child: new Text('不')),
        ],
      ),
    ) ?? false;
  }

  static Future<void> pop() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

}