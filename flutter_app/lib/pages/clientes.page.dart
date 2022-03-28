import 'package:flutter/material.dart';
import 'package:flutter_app/models/cliente.model.dart';
import 'package:flutter_app/repositories/cliente.repository.dart';
import 'package:flutter_app/widgets/form.custom.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({Key? key}) : super(key: key);

  @override
  _ClientesPageState createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  ClienteRepository repository = ClienteRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Cliente>>(
          future: repository.getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _listView(snapshot);
            }
            return _circularProgressIndicator();
          }),
      floatingActionButton: _create(context),
    );
  }

  _create(context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const FormCustom()),
        );
      },
      child: const Icon(Icons.person_add),
      backgroundColor: Colors.red[400],
    );
  }

  _circularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(color: Colors.red),
    );
  }

  _listView(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data?.length,
        itemBuilder: (context, index) {
          return _listTile(snapshot.data![index].nome);
        });
  }

  _listTile(String title) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(title),
        trailing: Wrap(
          spacing: -15,
          children: [
            _iconButton(Icons.remove_red_eye, _view),
            _iconButton(Icons.edit, _edit),
            _iconButton(Icons.delete, _delete),
          ],
        ),
      ),
    );
  }

  _iconButton(IconData icon, callback) {
    return IconButton(
      onPressed: () {
        callback();
      },
      icon: Icon(icon, size: 18),
      splashRadius: 15,
    );
  }

  _view(context) {}

  _edit(context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Editar'),
          );
        });
  }

  _delete(context) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Deletar'),
          );
        });
  }
}
