import 'package:flutter/material.dart';

class AppTheme {
  /// 亮色
  static ThemeData light = ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: const ColorScheme.light());

  /// 暗色
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
  );
}
