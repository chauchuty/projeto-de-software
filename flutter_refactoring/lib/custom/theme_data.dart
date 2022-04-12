import 'package:flutter/material.dart';

class ThemeDataCustom {
  static light() {
    return ThemeData(
      fontFamily: 'JosefinsSans',
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.white,
        onPrimary: Color(0xFF222222),
        secondary: Colors.redAccent,
        onSecondary: Colors.white,
        error: Colors.redAccent,
        onError: Colors.white,
        background: Colors.redAccent,
        onBackground: Colors.white,
        surface: Colors.redAccent,
        onSurface: Colors.white,
      ),
      drawerTheme: const DrawerThemeData(
        elevation: 0,
      ),
    );
  }

  static dark() {
    return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.black87,
        onPrimary: Colors.white,
        secondary: Colors.black87,
        onSecondary: Colors.white,
        error: Colors.black87,
        onError: Colors.white,
        background: Colors.black87,
        onBackground: Colors.white,
        surface: Colors.black87,
        onSurface: Colors.white,
      ),
      drawerTheme: const DrawerThemeData(
        elevation: 0,
      ),
    );
  }
}
