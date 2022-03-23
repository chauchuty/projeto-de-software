import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/appBar.custom.dart';
import 'package:flutter_app/widgets/drawer.custom.dart';

class ScaffoldCustom {
  static feature(BuildContext context, Widget widget) {
    return Scaffold(
      appBar: AppBarCustom.feature(),
      drawer: DrawerCustom.feature(),
      body: widget,
    );
  }
}
