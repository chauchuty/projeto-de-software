// ignore_for_file: dead_code

import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/appbar.custom.dart';
import 'package:flutter_app/widgets/menuBar.custom.dart';

class ScaffoldCustom extends StatefulWidget {
  const ScaffoldCustom({Key? key}) : super(key: key);

  @override
  _ScaffoldCustomState createState() => _ScaffoldCustomState();
}

class _ScaffoldCustomState extends State<ScaffoldCustom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: AppBarCustom(),
      ),
      body: Column(
        children: [
          const MenuBar(),
          Container(),
        ],
      ),
    );
  }
}
