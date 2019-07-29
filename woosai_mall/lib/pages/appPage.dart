
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:woosai_mall/pages/home/homePage.dart';
import 'package:woosai_mall/pages/find/findPage.dart';
import 'package:woosai_mall/pages/mine/minePage.dart';
import 'package:woosai_mall/common/application.dart';

class AppPage extends StatefulWidget {

  static final String sName = 'app';

  @override
  _AppPageState createState() => new _AppPageState();
}

class _AppPageState extends State<AppPage> with SingleTickerProviderStateMixin {

  // Tab页的控制器，可以用来定义Tab标签和内容页的坐标
  TabController tabController;
  var tabImages;
  int tabIndex = 0;
  var _controller = PageController(
    initialPage: 0,
  );
  @override
  void initState() {
    super.initState();
    initData();
    tabController = new TabController(
        length: 3, // Tab页的个数
        vsync: this, // 动画效果的异步处理，默认格式
    );
    Application.context = context;
  }

  // 生命周期方法构建Widget时调用
  @override
  Widget build(BuildContext context) {
    return new Scaffold(

      body: new PageView(
        controller: _controller,
        physics: new NeverScrollableScrollPhysics(),
        children: <Widget>[
          new HomePage(),
          new FindPage(),
          new MinePage(),
        ],
      ),
//      body: IndexedStack(
//        index: tabIndex,
//        children: <Widget>[
//          new HomePage(),
//          new FindPage(),
//          new MinePage(),
//        ],
//      ),
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
                  new Text('我的', style: TextStyle(fontSize: 10)),
                ],
              ),
            ),
          ],
          labelColor: Color(0xff1296db),
          unselectedLabelColor: Color(0xff999999),
          onTap: (index) {
            _controller.jumpToPage(index);
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
        getTabImage('assets/images/app-mine-icon.png'),
        getTabImage('assets/images/app-mine-active-icon.png'),
      ],
    ];
  }

  static Future<void> pop() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

}