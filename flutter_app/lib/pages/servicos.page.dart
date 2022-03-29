import 'package:flutter/material.dart';
import 'package:flutter_app/models/servicos.model.dart';
import 'package:flutter_app/repositories/servicos.repository.dart';
import 'package:flutter_app/utilities/utility.dart';
import 'package:flutter_app/widgets/form.custom.dart';

class ServicosPage extends StatefulWidget {
  const ServicosPage({Key? key}) : super(key: key);

  @override
  _ServicosPageState createState() => _ServicosPageState();
}

class _ServicosPageState extends State<ServicosPage> {
  ServicoRepository repository = ServicoRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Servico>>(
          future: repository.getAll(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _listView(snapshot);
            }
            return Utility.circularProgressIndicator();
          }),
      floatingActionButton: _create(context),
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
        leading: const Icon(Icons.content_cut),
        title: Text(title),
        trailing: Wrap(
          children: [
            _iconButton(context, Icons.remove_red_eye, _view, id),
            _iconButton(context, Icons.edit, _update, id),
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
      icon: Icon(icon, size: 20),
      splashRadius: 18,
    );
  }

  // Form, Create, View, Edit, Delete

  _form() {
    List<Map> dataField = [
      {
        'label': 'Nome',
        'name': 'nome',
        'icon': Icons.person,
        'type': 'string',
        'opcional': false,
        'controller': TextEditingController(),
      },
      {
        'label': 'Valor',
        'name': 'valor',
        'icon': Icons.paid,
        'type': 'number',
        'opcional': false,
        'controller': TextEditingController()
      },
      {
        'label': 'Descrição',
        'name': 'descricao',
        'icon': Icons.description,
        'type': 'string',
        'opcional': true,
        'controller': TextEditingController()
      }
    ];

    return FormCustom(
      title: 'Novo Serviço',
      dataField: dataField,
      repository: ServicoRepository(),
      instance: Servico(nome: 'nome', valor: 0),
    );
  }

  _create(context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => _form()),
        );
      },
      child: const Icon(Icons.add),
    );
  }

  _view(context, int id) {
    // view
  }

  _update(context, int id) {
    // update
  }

  _delete(context, int id) {
    // Delete
  }
}
