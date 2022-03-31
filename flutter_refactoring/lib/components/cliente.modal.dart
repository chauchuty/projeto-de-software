import 'package:flutter/material.dart';
import 'package:flutter_refactoring/models/cliente.model.dart';
import 'package:flutter_refactoring/widgets/app.bar.custom.dart';

class ClienteModal extends StatelessWidget {
  final bool editMode;
  final Cliente cliente;
  const ClienteModal({
    Key? key,
    required this.cliente,
    required this.editMode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Cliente'),
      // drawer: const DrawerCustom(),
      body: _body(context),
    );
  }

  _body(container) {
    return Form(
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20),
        child: ListView(
          children: [
            const SizedBox(height: 20),
            Icon(editMode ? Icons.manage_accounts : Icons.account_circle,
                size: 75),
            !editMode
                ? _textFormField(
                    label: 'Identificador',
                    icon: Icons.confirmation_number,
                    value: cliente.id.toString(),
                  )
                : const SizedBox(),
            _textFormField(
              label: 'Nome',
              icon: Icons.person,
              value: cliente.nome,
            ),
            _textFormField(
              label: 'Telefone',
              icon: Icons.phone,
              value: cliente.telefone,
            ),
            _textFormField(
              label: 'Email',
              icon: Icons.email,
              value: cliente.email,
            ),
            editMode ? _save() : const SizedBox()
          ],
        ),
      ),
    );
  }

  _textFormField({
    required String label,
    required IconData icon,
    required String value,
  }) {
    return TextFormField(
      readOnly: !editMode,
      enabled: editMode,
      initialValue: value,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        label: Text(label),
        icon: Icon(icon),
      ),
    );
  }

  _save() {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(Icons.save),
        label: Text('Salvar'),
      ),
    );
  }
}
