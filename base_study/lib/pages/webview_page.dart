import 'package:base_study/widgets/pro/webview/pro_webview.dart';
import 'package:flutter/material.dart';

class WebviewPage extends StatefulWidget {
  const WebviewPage({super.key});

  @override
  State<WebviewPage> createState() => _WebviewPageState();
}

class _WebviewPageState extends State<WebviewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Webview Page')),
      body: const ProWebview(url: 'https://pub.dev'),
    );
  }
}
