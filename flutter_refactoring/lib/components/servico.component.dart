import 'package:flutter/material.dart';
import 'package:flutter_refactoring/models/servico.model.dart';
import 'package:flutter_refactoring/utilities/snackbar.dart';
import 'package:flutter_refactoring/utilities/validate.dart';
import 'package:flutter_refactoring/widgets/app.bar.custom.dart';

class ServicoComponent extends StatefulWidget {
  // Settings
  final String title;
  final String mode;
  final Servico? servico;

  const ServicoComponent({
    Key? key,
    required this.title,
    required this.mode,
    this.servico,
  }) : super(key: key);

  @override
  State<ServicoComponent> createState() => _PacoteModalState();
}

class _PacoteModalState extends State<ServicoComponent> {
  final _formKey = GlobalKey<FormState>();
  final _nomeC = TextEditingController();
  final _descricaoC = TextEditingController();
  final _valorC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustom(
        title: widget.title,
        visibleActions: false,
      ),
      body: _body(context),
    );
  }

  _body(context) {
    switch (widget.mode) {
      case 'create':
        return _create(context);
      case 'read':
        return _read(context, servico: widget.servico);
      case 'update':
        return _update(context, servico: widget.servico);
      default:
    }
  }

  _create(context) {
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(15),
        children: [
          const Icon(
            Icons.content_cut,
            size: 75,
          ),
          _itemCreate('Nome *', Icons.content_cut, _nomeC,
              validator: ValidateCustom.isFullName),
          _itemCreate('Valor', Icons.attach_money, _descricaoC),
          _itemCreate('Descrição', Icons.format_align_center, _valorC),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                SnackBarCustom.success(context,
                    message: 'Cadastrado com sucesso!');
                Navigator.pop(context);
                return;
              }
              // SnackBarCustom.error(context,
              //     message: 'Usuário ou senha inválido!');
            },
            icon: const Icon(Icons.save),
            label: const Text('Cadastrar'),
          )
        ],
      ),
    );
  }

  _read(context, {Servico? servico}) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        const Icon(
          Icons.account_circle,
          size: 75,
        ),
        _itemRead('id', Icons.numbers, servico!.id.toString()),
        _itemRead('Serviço', Icons.work, servico.nome),
        _itemRead('Descrição', Icons.description, servico.descricao),
      ],
    );
  }

  _update(context, {Servico? servico}) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        const Icon(
          Icons.manage_accounts,
          size: 75,
        ),
        _itemUpdate('Serviço', Icons.work, servico!.nome),
        _itemUpdate(
            'Valor', Icons.attach_money, servico.valor.toStringAsFixed(2)),
        _itemUpdate('Descrição', Icons.description, servico.descricao),
        const SizedBox(height: 10),
        ElevatedButton.icon(
          onPressed: () {
            SnackBarCustom.success(
              context,
              message: 'Atualizado com sucesso!',
            );
          },
          icon: const Icon(Icons.update),
          label: const Text('Atualizar'),
        )
      ],
    );
  }

  _itemCreate(
    String label,
    IconData icon,
    TextEditingController controller, {
    Function? validator,
  }) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (!(validator == null)) {
          if (!validator(value)) {
            return 'Campo "$label" inválido!';
          }
        }

        return null;
      },
      decoration: InputDecoration(
        icon: Icon(icon),
        labelText: label,
      ),
    );
  }

  _itemRead(String label, IconData icon, String? title) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title!),
      ),
    );
  }

  _itemUpdate(String label, IconData icon, String? title) {
    return TextFormField(
      initialValue: title,
      decoration: InputDecoration(
        icon: Icon(icon),
        label: Text(label),
      ),
    );
  }
}
