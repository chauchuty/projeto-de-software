import 'package:flutter/material.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({Key? key}) : super(key: key);

  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _listTile(),
      ],
    );
  }

  _listTile() {
    return Column(
      children: const [
        Card(
          child: ListTile(
            leading: Icon(Icons.person),
            title: Text('Cesar'),
          ),
        ),
      ],
    );
  }
}
