import 'package:flutter/material.dart';

class Helper {
  static isDarkMode(BuildContext context) {
    return MediaQuery.platformBrightnessOf(context) == Brightness.dark;
  }
}
