import 'package:flutter/material.dart';
import 'package:flutter_app/models/cliente.model.dart';
import 'package:flutter_app/repositories/cliente.repository.dart';
import 'package:flutter_app/utilities/utility.dart';

class FormCustom extends StatefulWidget {
  final String title;
  const FormCustom({Key? key, required this.title}) : super(key: key);

  @override
  _FormCustomState createState() => _FormCustomState();
}

class _FormCustomState extends State<FormCustom> {
  ClienteRepository repository = ClienteRepository();
  final _formKey = GlobalKey<FormState>();
  final _controllerNome = TextEditingController();
  final _controllerTelefone = TextEditingController();
  final _controllerEmail = TextEditingController();

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
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _textField('Nome', Icons.person, 'string', _controllerNome),
            _textField('Telefone', Icons.phone, 'phone', _controllerTelefone),
            _textField('Email', Icons.email, 'email', _controllerEmail),
            _buttonSubmit(context)
          ],
        ),
      ),
    );
  }

  _textField(String title, IconData icon, String type,
      TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller,
        inputFormatters: [Utility.mask(type)],
        decoration: InputDecoration(
          icon: Icon(icon),
          labelText: title,
        ),
        validator: (value) {
          return Utility.validator(value, type);
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
            repository.insert(
              Cliente(
                  nome: _controllerNome.text,
                  telefone: _controllerTelefone.text,
                  email: _controllerEmail.text),
            );
            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Cadastrar'),
      ),
    );
  }
}
