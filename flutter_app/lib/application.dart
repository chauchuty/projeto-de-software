import 'package:flutter/material.dart';
import 'package:flutter_app/custom/themeData.custom.dart';
import 'package:flutter_app/widgets/scaffold.custom.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: const ScaffoldCustom(),
      theme: ThemeDataCustom.feature(),
      debugShowCheckedModeBanner: false,
    );
  }
}
