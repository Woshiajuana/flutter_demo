import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:playground/utils/index.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 滚动性能优化 1.22.0
  GestureBinding.instance.resamplingEnabled = true;

  // 沉浸式状态栏
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  // 本地数据持久化工具库初始化
  await StorageUtil().ensureInitialized();

  runApp(const App());
}
