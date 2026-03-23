import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

import 'pro_website.dart';

const _userAgent = <String, String>{
  "ios":
      "(iPhone; CPU iPhone OS 14_6 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.0 Mobile/15E148 Safari/604.1",
  "android":
      "(Linux; Android 10; SM-G973F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.120 Mobile Safari/537.36",
  "*":
      "(Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.124 Safari/537.36 MyApp/1.0.0",
};

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
  late final ValueNotifier<ProWebsite> urlNotifier = ValueNotifier(
    ProWebsite(),
  );

  @override
  Widget build(BuildContext context) {
    // if (urlNotifier.value.isEmpty() && isURL) {
    //   urlNotifier.value = urlNotifier.value.copyWith(
    //     title: isURL ? resource : null,
    //   );
    // }

    var webview = createWebview();

    if (!widget.showProgressBar) {
      return webview;
    }

    return Stack(
      children: [
        webview,

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

  Widget createWebview() {
    var resource = widget.url;
    var isURL = resource.startsWith('//') || resource.startsWith('http');
    var isAssets = resource.startsWith('assets/');
    final os = Platform.operatingSystem;

    return InAppWebView(
      // 设置
      initialSettings: InAppWebViewSettings(
        javaScriptEnabled: true, // 启用 Javascript 脚本
        alwaysBounceVertical: true, // 启用垂直滚动回弹效果（仅支持IOS系统）
        transparentBackground: true, // 设置背景完全透明（由网页决定背景颜色）
        cacheMode: CacheMode.LOAD_CACHE_ELSE_NETWORK, // 设置缓存模式
        supportZoom: false, // 禁用缩放配置
        userAgent:
            "Mozilla/5.0 ${_userAgent[os] ?? _userAgent["*"]} Flutter/1.0.0", // 统一设置用户代理头,
      ),
      // 初始化请求地址（根据地址的不同选择不同的初始化加载方式）
      initialUrlRequest: isURL ? URLRequest(url: WebUri(resource)) : null,
      initialData: isAssets || isURL
          ? null
          : InAppWebViewInitialData(data: resource),
      initialFile: isAssets ? resource : null,
      // 监听网页加载进度变更
      onProgressChanged: (controller, progress) {
        progressNotifier.value = progress / 100;
      },
      // 监听组件是否初始化完成
      onWebViewCreated: (controller) {
        //
      },
      // 监听网页的标题变更
      onTitleChanged: (controller, title) {
        urlNotifier.value = urlNotifier.value.copyWith(title: title);
      },
      // 监听加载开始
      onLoadStart: (controller, uri) {
        final rawUrl = uri!.rawValue;
        urlNotifier.value = urlNotifier.value.copyWith(url: rawUrl);
      },
    );
  }
}
