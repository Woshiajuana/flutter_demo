import 'package:flutter/material.dart';
import 'package:playground/utils/index.dart';

class ThemeState with ChangeNotifier {
  static const kThemeModeName = 'kThemeModeName';

  late final String _themeModeName;
  String get themeModeName => _themeModeName;

  ThemeState() {
    _themeModeName = StorageUtil().getItem(kThemeModeName) ?? 'system';
  }

  ThemeMode get themeMode {
    switch (_themeModeName) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  void changeThemeMode(String themeModeName) {
    if (_themeModeName == themeModeName) {
      return;
    }
    _themeModeName = themeModeName;
    StorageUtil().setItem(kThemeModeName, _themeModeName);
    notifyListeners();
  }
}
