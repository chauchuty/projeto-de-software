import 'package:flutter/material.dart';
import 'package:flutter_refactoring/widgets/app.bar.custom.dart';
import 'package:flutter_refactoring/widgets/drawer.custom.dart';

class AgendamentoPage extends StatelessWidget {
  const AgendamentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Agendamento'),
      drawer: const DrawerCustom(),
      body: _body(context),
    );
  }

  _body(context) {
    return Container();
  }
}
