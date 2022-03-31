import 'package:flutter/material.dart';
import 'package:flutter_refactoring/widgets/app.bar.custom.dart';
import 'package:flutter_refactoring/widgets/drawer.custom.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Home'),
      drawer: const DrawerCustom(),
      body: Container(),
    );
  }

  _body() {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [],
      ),
    );
  }
}
