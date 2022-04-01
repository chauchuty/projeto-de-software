import 'package:flutter/material.dart';
import 'package:flutter_refactoring/models/cliente.model.dart';
import 'package:flutter_refactoring/widgets/app.bar.custom.dart';

class ClienteModal extends StatelessWidget {
  final String title;
  final String mode;
  final Cliente? cliente;
  const ClienteModal({
    Key? key,
    required this.title,
    required this.mode,
    this.cliente,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: title,
        visibleActions: false,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    switch (mode) {
      case 'create':
        return _create(context);
      case 'read':
        return _read(context, cliente: cliente);
      case 'update':
        return _update(context, cliente: cliente);
      default:
    }
  }

  _create(context) {
    return Text('create');
  }

  _read(context, {Cliente? cliente}) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        const Icon(
          Icons.account_circle,
          size: 100,
        ),
        _itemRead(cliente!.id.toString(), Icons.numbers),
        _itemRead(cliente.nome, Icons.person),
        _itemRead(cliente.telefone, Icons.phone),
        _itemRead(cliente.email, Icons.email),
      ],
    );
  }

  _update(context, {Cliente? cliente}) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        const Icon(
          Icons.edit,
          size: 100,
        ),
        _itemUpdate(cliente!.nome, Icons.person),
        _itemUpdate(cliente.telefone, Icons.phone),
        _itemUpdate(cliente.email, Icons.email),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.update),
          label: const Text('Salvar'),
        )
      ],
    );
  }

  _itemRead(String title, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title),
      ),
    );
  }

  _itemUpdate(String title, IconData icon) {
    return TextFormField(
      initialValue: title,
      decoration: InputDecoration(icon: Icon(icon)),
    );
  }
}
