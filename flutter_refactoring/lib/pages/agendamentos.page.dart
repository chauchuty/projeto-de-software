import 'package:flutter/material.dart';
import 'package:flutter_refactoring/components/agendamento.component.dart';
import 'package:flutter_refactoring/models/agendamento.model.dart';
import 'package:flutter_refactoring/repositories/agendamento.repository.dart';
import 'package:flutter_refactoring/utilities/snackbar.dart';
import 'package:flutter_refactoring/widgets/app.bar.custom.dart';
import 'package:flutter_refactoring/widgets/drawer.custom.dart';
import 'package:intl/intl.dart';

class AgendamentosPage extends StatelessWidget {
  final AgendamentoRepository repository = AgendamentoRepository();

  AgendamentosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Agendamentos'),
      drawer: const DrawerCustom(),
      body: _body(context),
      floatingActionButton: _create(context),
    );
  }

  _body(context) {
    final agendamentos = repository.getAll();
    return ListView.builder(
      itemBuilder: (context, index) {
        return _listView(context, agendamentos[index]);
      },
      itemCount: agendamentos.length,
    );
  }

  _listView(context, Agendamento agendamento) {
    return Card(
      child: ListTile(
        onTap: () {
          _read(context, agendamento);
        },
        leading: const Icon(
          Icons.calendar_month,
          size: 35,
        ),
        title: Text(agendamento.cliente.nome),
        subtitle: Text(
          "Início: " +
              DateFormat('kk:mm / dd-MM-yyy').format(agendamento.dataInicio),
        ),
        // subtitle: Text(agendamento.email!),
        trailing: Wrap(
          children: [
            _update(context, agendamento, isEnabled: false),
            _delete(context, agendamento),
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
            builder: (context) => const AgendamentoComponent(
                title: 'Cadastrar Agendamento', mode: 'create'),
          ),
        );
      },
      child: const Icon(Icons.add),
    );
  }

  _read(context, Agendamento agendamento) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AgendamentoComponent(
          title: 'Agendamento',
          mode: 'read',
          agendamento: agendamento,
        ),
      ),
    );
  }

  _update(context, Agendamento agendamento, {bool isEnabled = true}) {
    return IconButton(
      onPressed: () {
        if (isEnabled) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AgendamentoComponent(
                title: 'Atualizar Agendamento',
                mode: 'update',
                agendamento: agendamento,
              ),
            ),
          );
        }
      },
      icon: const Icon(Icons.edit),
      splashRadius: 20,
    );
  }

  _delete(context, Agendamento agendamento) {
    return IconButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return _alertDialogDelete(context, agendamento);
          },
        );
      },
      icon: const Icon(Icons.delete),
      splashRadius: 20,
    );
  }

  _alertDialogDelete(context, Agendamento agendamento) {
    return AlertDialog(
      content: Text(
        '"Agendamento de: \n\n${agendamento.cliente.nome} \nAgendamento: #${agendamento.id}',
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
