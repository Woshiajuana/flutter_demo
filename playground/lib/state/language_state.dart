import 'package:flutter/material.dart';
import 'package:playground/utils/index.dart';

const String _languageIndexKey = 'system.language.index';

class LanguageState with ChangeNotifier {
  static const Map<String, String> languageCodeLabelMap = {
    'zh': '简体中文',
    'en': 'English',
  };

  /// 为 null 则跟随系统
  String? _languageCode;
  Locale? get locale {
    return _languageCode == null ? null : Locale(_languageCode!);
  }

  LanguageState() {
    _languageCode = StorageUtil().getItem(_languageIndexKey);
  }

  void changeLanguage(String languageCode) {
    if (_languageCode == languageCode) {
      return;
    }
    _languageCode = languageCode;
    StorageUtil().setItem(_languageIndexKey, _languageCode);
    notifyListeners();
  }
}
