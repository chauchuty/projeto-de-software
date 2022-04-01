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
      body: _body(context),
    );
  }

  _body(context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(30.0),
          child: Text(
            'Salão de Beleza - UTFPR',
            style: TextStyle(fontSize: 30),
          ),
        ),
        Row(
          children: [
            Expanded(child: _card('Agendamentos', 8, Icons.schedule)),
          ],
        ),
        Row(
          children: [
            Expanded(child: _card('Serviços', 10, Icons.work)),
            Expanded(child: _card('Clientes', 57, Icons.person)),
          ],
        )
      ],
    );
  }

  _card(String title, int qtd, IconData icon) {
    return Card(
        child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          leading: Icon(icon),
          title: Text("$title: $qtd"),
        ),
      ],
    ));
  }
}
