import 'package:flutter/material.dart';
import 'package:flutter_app/models/cliente.model.dart';
import 'package:flutter_app/repositories/cliente.repository.dart';
import 'package:flutter_app/utilities/utility.dart';

class FormCustom extends StatefulWidget {
  final String title;
  final dynamic dataField;
  final dynamic repository;
  const FormCustom({
    Key? key,
    required this.title,
    required this.dataField,
    required this.repository,
  }) : super(key: key);

  @override
  _FormCustomState createState() => _FormCustomState();
}

class _FormCustomState extends State<FormCustom> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: _form(context),
    );
  }

  _form(BuildContext context) {
    var dataField =
        (widget.dataField as List).map((df) => _textField(df)).toList();

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(children: [...dataField, _buttonSubmit(context)]),
      ),
    );
  }

  _textField(df) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: df['controller'],
        inputFormatters: [Utility.mask(df['type'])],
        decoration: InputDecoration(
          icon: Icon(df['icon']),
          labelText: df['label'],
        ),
        validator: (value) {
          return Utility.validator(value, df['type']);
        },
      ),
    );
  }

  _buttonSubmit(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: TextButton.icon(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Cadastrando...'),
              ),
            );
            // Continuar
            // widget.repository.insert(
            //   Cliente(
            //       nome: _controllerNome.text,
            //       telefone: _controllerTelefone.text,
            //       email: _controllerEmail.text),
            // );
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Cadastrar'),
      ),
    );
  }
}
