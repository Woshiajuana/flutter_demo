import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class ProWebview extends StatefulWidget {
  /// 网页加载的地址：可以是 ”URL/assets/本地文件“ 之类的参数
  final String url;

  /// 是否显示进度条
  final bool showProgressBar;

  const ProWebview({super.key, required this.url, this.showProgressBar = true});

  @override
  State<ProWebview> createState() => _ProWebviewState();
}

class _ProWebviewState extends State<ProWebview> {
  // 1、创建 ValueNotifier 对象并设置 “初始值”；
  // 2、使用 late 延迟初始化以提升加载效率；
  late final ValueNotifier<double> progressNotifier = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(widget.url)),
          onProgressChanged: (controller, progress) {
            progressNotifier.value = progress / 100;
          },
        ),
        ValueListenableBuilder(
          valueListenable: progressNotifier,
          builder: (context, value, child) {
            return AnimatedOpacity(
              // 使用淡入淡出的组件
              // 通过进度值去改变透明值
              // 当透明值发生变化时 AnimatedOpacity 组件会自动应用动画过渡效果
              opacity: value == 0 ? 1 : (value == 1 ? 0 : 1),
              // 动画过渡的时长，时长越长过渡效果越明显
              duration: const Duration(milliseconds: 400),
              // 正常返回进度条组件
              child: LinearProgressIndicator(
                value: value,
                minHeight: 3,
                color: Colors.redAccent,
                backgroundColor: Colors.transparent,
              ),
            );
          },
        ),
      ],
    );
  }
}
