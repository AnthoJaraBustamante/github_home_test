import 'package:flutter/material.dart';

class ColorTheme {
  static const Color primary = Color(0xFFFFFFFF);
  static const Color primaryDark = Color(0xFFF8F8F8);
  static const Color primaryLight = Color(0xFFF8F8F8);
  
  static const Color secondary = Color(0xFF3FB950);
  static const Color secondaryDark = Color(0xFF3FB950);
  static const Color secondaryLight = Color(0xFF3FB950);
 

  static const Color dark = Color(0xFF0D1117);
  static const Color light = Color(0XFFC9D1D9);

  static Map<int, Color> primaryMap = {
    50: ColorTheme.light.withOpacity(0.05),
    100: ColorTheme.light.withOpacity(0.1),
    200: ColorTheme.light.withOpacity(0.2),
    300: ColorTheme.light.withOpacity(0.3),
    400: ColorTheme.light.withOpacity(0.4),
    500: ColorTheme.light,
    600: ColorTheme.light.withOpacity(0.6),
    700: ColorTheme.light.withOpacity(0.7),
    800: ColorTheme.light.withOpacity(0.8),
    900: ColorTheme.light.withOpacity(0.9),
  };
}
