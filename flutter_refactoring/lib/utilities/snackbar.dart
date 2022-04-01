import 'package:flutter/material.dart';

class SnackBarCustom {
  static standart(context, {required message}) async {
    _feature(context, message, Colors.blueAccent, 3);
  }

  static success(context, {required message}) async {
    _feature(context, message, Colors.green, 3);
  }

  static warning(context, {required message}) async {
    _feature(context, message, Colors.orangeAccent, 3);
  }

  static error(context, {required message}) async {
    _feature(context, message, Colors.redAccent, 3);
  }

  static _feature(
      BuildContext context, String message, Color color, int duration) {
    final snackBar = SnackBar(
      duration: Duration(seconds: duration),
      backgroundColor: color,
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.white),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
