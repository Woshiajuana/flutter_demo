
import 'package:flutter/material.dart';

class AppPage extends StatefulWidget {
  @override
  _AppPageState createState() => new _AppPageState();
}

class _AppPageState extends State<AppPage> with SingleTickerProviderStateMixin {

  // Tab页的控制器，可以用来定义Tab标签和内容页的坐标
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(
        length: null, // Tab页的个数
        vsync: this, // 动画效果的异步处理，默认格式
    );
  }

  // 生命周期方法构建Widget时调用
  @override
  Widget build(BuildContext context) {
    initData();

  }

  // 组件即将销毁时调用
  @override
  void dispose() {
    // 释放内存，节省开销
    tabController.dispose();
    super.dispose();
  }


}