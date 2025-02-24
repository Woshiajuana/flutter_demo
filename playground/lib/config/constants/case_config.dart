import 'package:playground/config/routes/index.dart';

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
      path: RoutePath.cell,
      title: 'Cell 单元格',
      subtitle: '单元格为列表中的单个展示项',
    ),
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
