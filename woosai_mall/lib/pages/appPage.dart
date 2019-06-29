
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/homePage.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => new _AppPageState();
}

class _AppPageState extends State<AppPage> with SingleTickerProviderStateMixin {

  // Tab页的控制器，可以用来定义Tab标签和内容页的坐标
  TabController tabController;
  var tabTitles = [ '首页', '发现', '购物车', '我的' ];
  var tabImages;
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(
        length: tabTitles.length, // Tab页的个数
        vsync: this, // 动画效果的异步处理，默认格式
    );
  }

  // 生命周期方法构建Widget时调用
  @override
  Widget build(BuildContext context) {
    initData();
    return new Scaffold(
      body: new TabBarView(
        controller: tabController,
        physics: new NeverScrollableScrollPhysics(),
        children: <Widget>[
          new HomePage(),
          new HomePage(),
          new HomePage(),
          new HomePage(),
        ],
      ),
      bottomNavigationBar: new Material(
        color: Colors.white,
        elevation: 0.0,
        child: new TabBar(
          indicatorColor: Colors.white,
          controller: tabController,
          tabs: <Tab>[
            new Tab(text: tabTitles[0], icon: getTabIcon(0)),
            new Tab(text: tabTitles[1], icon: getTabIcon(1)),
            new Tab(text: tabTitles[2], icon: getTabIcon(2)),
            new Tab(text: tabTitles[3], icon: getTabIcon(3)),
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
    return new Image.asset(path, width: 30.0, height: 30.0,fit: BoxFit.fill,);
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
        getTabImage('assets/images/app-home-icon.png'),
      ],
      [
        getTabImage('assets/images/app-home-icon.png'),
        getTabImage('assets/images/app-home-icon.png'),
      ],
      [
        getTabImage('assets/images/app-home-icon.png'),
        getTabImage('assets/images/app-home-icon.png'),
      ],
      [
        getTabImage('assets/images/app-home-icon.png'),
        getTabImage('assets/images/app-home-icon.png'),
      ],
    ];
  }
}