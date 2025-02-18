import 'package:playground/route/index.dart';

class CaseItem {
  CaseItem({
    required this.path,
    required this.title,
    this.subtitle,
  });

  String path;
  String title;
  String? subtitle;
}

class CaseConfig {
  static List<CaseItem> data = [
    CaseItem(
      path: RoutePath.signature,
      title: '手写签名',
      subtitle: 'canvas 绘制，转换图片知识点',
    ),
    CaseItem(
      path: RoutePath.crossFlow,
      title: '十字架布局',
      subtitle: '需要自定义布局策略的场景',
    ),
  ];
}
