import 'package:flutter/material.dart';

class ThemeDataCustom {
  static feature() {
    return ThemeData(
      scaffoldBackgroundColor: Colors.grey[100],
      appBarTheme: AppBarTheme(
        titleTextStyle: const TextStyle(
          fontFamily: 'Inspiration',
          fontSize: 40,
          color: Colors.white,
        ),
        backgroundColor: Colors.red[400],
      ),
    );
  }
}
