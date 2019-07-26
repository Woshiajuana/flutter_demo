
import 'package:flutter/material.dart';

class Style {

  static final Style _style = Style._internal();

  factory Style () {
    return _style;
  }

  static const String TAO_BAO_FAMILY = 'taobaoIconFont';

  Style._internal();

  String get srcAddress {
    return 'assets/images/address-icon.png';
  }

  String get srcLogo {
    return 'assets/images/app-logo-icon-100.png';
  }

  String get srcGoodsNull {
    return 'assets/images/goods-icon-null-bg.png';
  }

  IconData get iconSearch {
    return IconData(0xe7da, fontFamily: TAO_BAO_FAMILY);
  }

}