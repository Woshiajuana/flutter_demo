import 'package:flutter/material.dart';
import 'package:playground/utils/extensions/l10n_extension.dart';
import 'package:playground/utils/index.dart';

const String _themeModeIndexKey = 'system.themeMode.index';

class ThemeState with ChangeNotifier {
  late ThemeMode _themeMode;
  ThemeMode get themeMode => _themeMode;

  ThemeState() {
    var index =
        StorageUtil().getItem(_themeModeIndexKey) ?? ThemeMode.system.index;
    _themeMode = ThemeMode.values[index];
  }

  bool get isFollowSystem {
    return themeMode == ThemeMode.system;
  }

  void changeThemeMode(ThemeMode themeMode) {
    if (_themeMode == themeMode) {
      return;
    }
    _themeMode = themeMode;
    StorageUtil().setItem(_themeModeIndexKey, _themeMode.index);
    notifyListeners();
  }

  String getThemeModeName(BuildContext context) {
    var index = themeMode.index;
    return [
      context.l10n.themeSettingsAutomatic,
      context.l10n.themeSettingsLight,
      context.l10n.themeSettingsDark,
    ][index];
  }
}
