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

  _circularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(color: Colors.red),
    );
  }

  _listView(AsyncSnapshot snapshot) {
    return ListView.builder(
        itemCount: snapshot.data?.length,
        itemBuilder: (context, index) {
          return _listTile(
              context, snapshot.data![index].nome, snapshot.data![index].id);
        });
  }

  _listTile(context, String title, int id) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person),
        title: Text(title),
        trailing: Wrap(
          spacing: -15,
          children: [
            _iconButton(context, Icons.remove_red_eye, _view, id),
            _iconButton(context, Icons.edit, _edit, id),
            _iconButton(context, Icons.delete, _delete, id),
          ],
        ),
      ),
    );
  }

  _iconButton(context, IconData icon, callback, id) {
    return IconButton(
      onPressed: () {
        callback(context, id);
      },
      icon: Icon(icon, size: 18),
      splashRadius: 15,
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

  _view(context, int id) {
    showDialog(
        context: context,
        builder: (context) {
          return FutureBuilder<Cliente?>(
            future: repository.getOne(id),
            builder: ((context, snapshot) {
              if (snapshot.hasData) {
                return AlertDialog(
                  title:
                      Text("${snapshot.data!.nome} (id: ${snapshot.data!.id})"),
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text("Telefone: ${snapshot.data!.telefone}"),
                        const SizedBox(height: 20),
                        Text("Email: ${snapshot.data!.telefone}"),
                      ],
                    ),
                  ),
                );
              }
              return _circularProgressIndicator();
            }),
          );
        });
  }

  _edit(context, int id) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Editar'),
          );
        });
  }

  _delete(context, int id) {
    showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Text('Deletar'),
          );
        });
  }
}
