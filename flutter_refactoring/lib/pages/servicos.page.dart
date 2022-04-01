import 'package:flutter/material.dart';
import 'package:flutter_refactoring/components/servico.component.dart';
import 'package:flutter_refactoring/models/servico.model.dart';
import 'package:flutter_refactoring/repositories/servico.repository.dart';
import 'package:flutter_refactoring/utilities/snackbar.dart';
import 'package:flutter_refactoring/widgets/app.bar.custom.dart';
import 'package:flutter_refactoring/widgets/drawer.custom.dart';

class ServicosPage extends StatelessWidget {
  final ServicoRepository repository = ServicoRepository();

  ServicosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Serviços'),
      drawer: const DrawerCustom(),
      body: _body(context),
      floatingActionButton: _create(context),
    );
  }

  _body(context) {
    final servicos = repository.getAll();
    return ListView.builder(
      itemBuilder: (context, index) {
        return _listView(context, servicos[index]);
      },
      itemCount: servicos.length,
    );
  }

  _listView(context, Servico servico) {
    return Card(
      child: ListTile(
        onTap: () {
          _read(context, servico);
        },
        leading: const Icon(
          Icons.account_box,
          size: 35,
        ),
        title: Text(servico.nome),
        // subtitle: Text(servico.email!),
        trailing: Wrap(
          children: [
            _update(context, servico),
            _delete(context, servico),
          ],
        ),
      ),
    );
  }

  _create(context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ServicoComponent(
                title: 'Cadastrar Serviço', mode: 'create'),
          ),
        );
      },
      child: const Icon(Icons.person_add),
    );
  }

  _read(context, Servico servico) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ServicoComponent(
          title: 'Serviço',
          mode: 'read',
          servico: servico,
        ),
      ),
    );
  }

  _update(context, Servico servico) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ServicoComponent(
              title: 'Atualizar Serviço',
              mode: 'update',
              servico: servico,
            ),
          ),
        );
      },
      icon: const Icon(Icons.edit),
      splashRadius: 20,
    );
  }

  _delete(context, Servico servico) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _alertDialogDelete(context, servico);
          },
        );
      },
      icon: const Icon(Icons.delete),
      splashRadius: 20,
    );
  }

  _alertDialogDelete(context, Servico servico) {
    return AlertDialog(
      title: Text(
        '"${servico.nome}" (#${servico.id})',
        textAlign: TextAlign.center,
      ),
      actions: [
        TextButton.icon(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.delete, color: Colors.grey),
          label: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.grey),
          ),
        ),
        TextButton.icon(
          onPressed: () {
            SnackBarCustom.success(context, message: 'Deletado com sucesso!');
            Navigator.pop(context);
          },
          icon: const Icon(Icons.delete),
          label: const Text('Deletar'),
        ),
      ],
    );
  }
}
