import 'package:flutter/material.dart';

class AppBarCustom {
  static feature() {
    return AppBar(
      title: Text(''),
      actions: const [
        Icon(Icons.exit_to_app),
      ],
    );
  }
}
