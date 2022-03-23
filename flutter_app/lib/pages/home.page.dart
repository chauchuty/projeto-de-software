import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/scaffold.custom.dart';

class HomePage extends StatelessWidget {
  final String title;

  const HomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom.feature(
      context,
      const Text('Home Page'),
    );
  }
}
