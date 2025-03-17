import 'package:playground/config/routes/index.dart';

class DemoItem {
  DemoItem({
    required this.path,
    required this.title,
    required this.subtitle,
  });

  String path;
  String title;
  String subtitle;
}

class DemoConfig {
  static List<DemoItem> data = [
    DemoItem(
      path: RouteNames.cell,
      title: 'Cell 单元格',
      subtitle: '单元格为列表中的单个展示项',
    ),
    DemoItem(
      path: RouteNames.dialog,
      title: '各种弹窗',
      subtitle: '内置弹窗、自定义弹窗',
    ),
    DemoItem(
      path: RouteNames.signature,
      title: '手写签名',
      subtitle: 'canvas 绘制，转换图片知识点',
    ),
    DemoItem(
      path: RouteNames.crossFlow,
      title: '十字架布局',
      subtitle: '需要自定义布局策略的场景',
    ),
  ];
}
