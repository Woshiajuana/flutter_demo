import 'package:flutter/material.dart';
import 'package:playground/utils/index.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // 本地数据持久化工具库初始化
  await StorageUtil().ensureInitialized();

  runApp(const App());
}
