import 'package:flutter/material.dart';

class ColorTheme {
  static const Color primary = Color(0xFFFFFFFF);
  static const Color primaryDark = Color(0xFFF8F8F8);
  static const Color primaryLight = Color(0xFFF8F8F8);
  static const Color primaryVariant = Color(0xFFB20000);
  static const Color secondary = Color(0xFFB20000);
  static const Color secondaryDark = Color(0xFFB20000);
  static const Color secondaryLight = Color(0xFFB20000);
  static const Color secondaryVariant = Color(0xFFB20000);

  static const Color dark = Color(0xFF21262d);
  static const Color light = Color(0xFFFFFFFF);

  static Map<int, Color> primaryMap = {
    50: ColorTheme.primary.withOpacity(0.05),
    100: ColorTheme.primary.withOpacity(0.1),
    200: ColorTheme.primary.withOpacity(0.2),
    300: ColorTheme.primary.withOpacity(0.3),
    400: ColorTheme.primary.withOpacity(0.4),
    500: ColorTheme.primary,
    600: ColorTheme.primary.withOpacity(0.6),
    700: ColorTheme.primary.withOpacity(0.7),
    800: ColorTheme.primary.withOpacity(0.8),
    900: ColorTheme.primary.withOpacity(0.9),
  };
}
