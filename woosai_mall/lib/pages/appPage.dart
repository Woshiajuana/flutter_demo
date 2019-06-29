
import 'package:flutter/material.dart';
import 'package:woosai_mall/pages/homePage.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => new _AppPageState();
}

class _AppPageState extends State<AppPage> with SingleTickerProviderStateMixin {

  // Tab页的控制器，可以用来定义Tab标签和内容页的坐标
  TabController tabController;
  var tabArr = [
    {
      title: '首页',
    }
  ];
  int tabIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(
        length: tabArr.length, // Tab页的个数
        vsync: this, // 动画效果的异步处理，默认格式
    );
  }

  // 生命周期方法构建Widget时调用
  @override
  Widget build(BuildContext context) {
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
            new Tab(
              child: Column(
                children: <Widget>[
                  new Image.asset('assets/images/app-home-icon.png'),
                  new Text('首页')
                ],
              ),
            ),
            new Tab(
              child: Column(
                children: <Widget>[
                  new Image.asset('assets/images/app-home-icon.png'),
                  new Text('首页')
                ],
              ),
            ),
            new Tab(
              child: Column(
                children: <Widget>[
                  new Image.asset('assets/images/app-home-icon.png'),
                  new Text('首页')
                ],
              ),
            ),
            new Tab(
              child: Column(
                children: <Widget>[
                  new Image.asset('assets/images/app-home-icon.png'),
                  new Text('首页')
                ],
              ),
            ),
          ],
          labelColor: Color(0xffAAA5B2),
          unselectedLabelColor: Color(0xffAAA5B2),
          onTap: (index) {
            setState(() {
              _tabIndex = index;
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

}