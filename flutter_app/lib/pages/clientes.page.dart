import 'package:flutter/material.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({Key? key}) : super(key: key);

  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          _listTile('Cesar'),
          _listTile('Murilo'),
          _listTile('Jucinaldo'),
          _listTile('Marcos'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.person_add),
        backgroundColor: Colors.red[400],
      ),
    );
  }

  _listTile(String title) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(title),
        trailing: Wrap(
          spacing: -10,
          children: [
            _iconButton(Icons.remove_red_eye, Colors.blue, _view),
            _iconButton(Icons.edit, Colors.orange, _view),
            _iconButton(Icons.delete, Colors.red, _view),
          ],
        ),
      ),
    );
  }

  _iconButton(IconData icon, Color iconColor, callback) {
    return IconButton(
      onPressed: () {
        callback(context);
      },
      icon: Icon(icon, color: iconColor, size: 20),
      splashRadius: 15,
    );
  }

  _view(context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Hello World'),
          );
        });
  }
}
