import 'package:flutter/material.dart';
import 'package:playground/utils/extensions/l10n_extension.dart';
import 'package:playground/utils/index.dart';

const String _languageIndexKey = 'system.language.index';

class LanguageState with ChangeNotifier {
  static const Map<String, String> languageCodeLabelMap = {
    'zh': '简体中文',
    'en': 'English',
  };

  /// 为 null 则跟随系统
  String? _languageCode;
  String? get languageCode => _languageCode;

  Locale? get locale {
    return _languageCode == null ? null : Locale(_languageCode!);
  }

  LanguageState() {
    _languageCode = StorageUtil().getItem(_languageIndexKey);
  }

  bool get isFollowSystem {
    return _languageCode == null;
  }

  void changeLanguage(String? languageCode) {
    if (_languageCode == languageCode) {
      return;
    }
    _languageCode = languageCode;
    if (languageCode == null) {
      StorageUtil().removeItem(_languageIndexKey);
    } else {
      StorageUtil().setItem(_languageIndexKey, _languageCode);
    }
    notifyListeners();
  }

  String getLanguageCodeName(BuildContext context) {
    if (_languageCode == null) {
      return context.l10n.languageSettingsAutomatic;
    }
    return languageCodeLabelMap[_languageCode!] ?? languageCodeLabelMap['zh']!;
  }
}
