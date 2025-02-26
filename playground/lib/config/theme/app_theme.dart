import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';

class AppTheme {
  /// 亮色
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
    ),
    scaffoldBackgroundColor: const Color(0xffF3F8F9),
    appBarTheme: const AppBarTheme(
      elevation: 0,
      backgroundColor: Color(0xffF3F8F9),
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: Color(0xFF000000),
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
      surfaceTintColor: Colors.transparent,
    ),
  );

  /// 暗色
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(),
  );
}
