import 'package:flutter/material.dart';

class AppBarCustom {
  static feature() {
    return AppBar(
      title: const Text('Hello World'),
      actions: [
        Icon(Icons.exit_to_app),
      ],
    );
  }
}
