import 'package:flutter/material.dart';
import 'package:github_home_test/app/ui/theme/color_theme.dart';

class AppTheme {
 
  static final ThemeData darkThemeData = ThemeData(
    scaffoldBackgroundColor: ColorTheme.dark,
    primaryColor: ColorTheme.primary,
    appBarTheme: const AppBarTheme(
      backgroundColor: ColorTheme.dark,
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.white),
    ),
    primarySwatch:
        MaterialColor(ColorTheme.primaryMap[900]!.value, ColorTheme.primaryMap),
    // primaryTextTheme: TextStyleTheme.darkTextTheme,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: ColorTheme.primary,
      selectionColor: ColorTheme.primary.withOpacity(0.4),
      selectionHandleColor: ColorTheme.primary,
    ),
    // textTheme: TextStyleTheme.darkTextTheme,
    primaryIconTheme: const IconThemeData(color: ColorTheme.light),
    iconTheme: const IconThemeData(color: ColorTheme.light),
    hintColor: ColorTheme.light,
    brightness: Brightness.dark,
    dividerColor: ColorTheme.light,
  );
}
