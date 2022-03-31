import 'package:flutter/material.dart';

class SnackBarCustom {
  static feature(context, {required message}) async {
    final snackBar = SnackBar(
      duration: const Duration(seconds: 2),
      content: Text(
        message,
        textAlign: TextAlign.center,
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
