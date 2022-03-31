import 'package:flutter/material.dart';

class ThemeDataCustom {
  static light() {
    return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.dark,
        primary: Colors.redAccent,
        onPrimary: Colors.white,
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
}
