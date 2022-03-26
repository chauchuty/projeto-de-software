import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.page.dart';
import 'package:flutter_app/widgets/appBar.custom.dart';

class ScaffoldCustom extends StatefulWidget {
  const ScaffoldCustom({Key? key}) : super(key: key);

  @override
  _ScaffoldCustomState createState() => _ScaffoldCustomState();
}

class _ScaffoldCustomState extends State<ScaffoldCustom> {
  Widget page = const HomePage();

  callback(Widget widget) {
    setState(() {
      page = widget;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size(0, 100),
        child: AppBarCustom(callback: callback),
      ),
      body: page,
    );
  }
}
