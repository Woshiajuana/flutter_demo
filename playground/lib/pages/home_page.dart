import 'package:flutter/material.dart';

class PageRoute {
  PageRoute({required this.title, this.subtitle});

  String title;
  String? subtitle;
}

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<PageRoute> _routes = [
    PageRoute(title: '手写签名', subtitle: 'canvas 绘制，转换图片知识点'),
    PageRoute(title: '十字架布局', subtitle: '需要自定义布局策略的场景'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('演练场'),
      ),
      body: ListView.separated(
        itemCount: _routes.length,
        separatorBuilder: (context, index) => Divider(
          indent: 16,
          endIndent: 16,
          color: Colors.grey[200],
        ),
        itemBuilder: (context, index) {
          return _buildItem(route: _routes[index]);
        },
      ),
    );
  }

  Widget _buildItem({
    required PageRoute route,
  }) {
    return ListTile(
      onTap: () => {
        //
      },
      title: Text(
        route.title,
        style: const TextStyle(fontSize: 18),
      ),
      subtitle: route.subtitle != null ? Text(route.subtitle!) : null,
      trailing: const Icon(
        Icons.arrow_forward_ios_rounded,
        size: 16,
      ),
    );
  }
}
