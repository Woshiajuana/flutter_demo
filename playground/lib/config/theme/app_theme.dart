import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app_colors.dart';
import 'custom_colors.dart';

class AppTheme {
  /// 亮色
  static ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,

    // 拓展
    extensions: [
      CustomColors(),
    ],

    // 颜色方案
    colorScheme: const ColorScheme.light().copyWith(
      primary: AppColors.primaryColor,
      background: const Color(0xffF3F8F9),
    ),

    // app bar
    appBarTheme: const AppBarTheme(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Color(0xffF3F8F9),
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.light,
      ),
    ),

    // ListTile
    listTileTheme: const ListTileThemeData(
      tileColor: Colors.white,
      textColor: Color(0xff000000),
      iconColor: Color(0xff999999),
    ),

    // 分割线
    dividerTheme: const DividerThemeData(
      color: Color(0xffe8e8e8),
    ),
  );

  /// 暗色
  static ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,

    // 拓展
    extensions: [
      CustomColors(),
    ],

    // 颜色方案
    colorScheme: const ColorScheme.dark().copyWith(
      primary: AppColors.primaryColor,
      background: const Color(0xff010201),
    ),

    // app bar
    appBarTheme: const AppBarTheme(
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      backgroundColor: Color(0xff010201),
      systemOverlayStyle: SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.dark,
      ),
    ),

    // ListTile
    listTileTheme: const ListTileThemeData(
      tileColor: Color(0xff181818),
      textColor: Color(0xffffffff),
      iconColor: Color(0xff898989),
    ),

    // 分割线
    dividerTheme: const DividerThemeData(
      color: Color(0xff2b2b2b),
    ),
  );
}
