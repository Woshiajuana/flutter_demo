import 'package:flutter/material.dart';
import 'package:playground/pages/home/home_page.dart';
import 'package:playground/pages/mine/mine_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late PageController _pageController;
  var _current = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _current);
  }

  void _handlePageChange(index) {
    _current = index;
    setState(() {});
  }

  void _handleSwitch(index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: _handlePageChange,
        children: const [
          HomePage(),
          MinePage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _current,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '首页',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: '我的',
          ),
        ],
        onTap: _handleSwitch,
      ),
    );
  }
}
