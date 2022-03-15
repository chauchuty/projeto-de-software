import 'package:flutter/material.dart';
import 'package:flutter_app/compoments/drawer.component.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const DrawerComponent(),
      body: const Center(
        child: Text("Clientes"),
      ),
    );
  }
}
