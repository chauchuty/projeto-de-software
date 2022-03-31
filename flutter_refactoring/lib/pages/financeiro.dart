import 'package:flutter/material.dart';
import 'package:flutter_refactoring/widgets/app.bar.custom.dart';
import 'package:flutter_refactoring/widgets/drawer.custom.dart';

class FinanceiroPage extends StatelessWidget {
  const FinanceiroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Financeiro'),
      drawer: const DrawerCustom(),
      body: _body(context),
    );
  }

  _body(context) {
    return Container();
  }
}
