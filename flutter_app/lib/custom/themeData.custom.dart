import 'package:flutter/material.dart';

class ThemeDataCustom {
  static feature() {
    return ThemeData(
      colorScheme: const ColorScheme(
        brightness: Brightness.light,
        primary: Colors.redAccent,
        onPrimary: Colors.white,
        secondary: Colors.redAccent,
        onSecondary: Colors.white,
        error: Colors.brown,
        onError: Colors.purple,
        background: Colors.redAccent,
        onBackground: Colors.redAccent,
        surface: Colors.redAccent,
        onSurface: Colors.redAccent,
      ),
    );
  }
}
