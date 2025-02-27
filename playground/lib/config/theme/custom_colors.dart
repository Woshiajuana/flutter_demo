import 'package:flutter/material.dart';

class CustomColors extends ThemeExtension<CustomColors> {
  CustomColors({
    this.customBackground,
  });
  final Color? customBackground;

  @override
  ThemeExtension<CustomColors> copyWith({
    Color? customBackground,
    Color? customText,
  }) {
    return CustomColors(
      customBackground: customBackground ?? this.customBackground,
    );
  }

  @override
  ThemeExtension<CustomColors> lerp(
    covariant ThemeExtension<ThemeExtension>? other,
    double t,
  ) {
    if (other is! CustomColors) {
      return this;
    }
    return CustomColors(
      customBackground: Color.lerp(customBackground, other.customBackground, t),
    );
  }

  static CustomColors of(BuildContext context) {
    return Theme.of(context).extension<CustomColors>()!;
  }
}
