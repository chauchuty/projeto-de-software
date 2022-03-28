import 'package:flutter/material.dart';

class FormCustom extends StatefulWidget {
  const FormCustom({Key? key}) : super(key: key);

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
        title: const Text('Novo Cliente'),
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
            _textField('Nome', Icons.person),
            _textField('Telefone', Icons.phone),
            _textField('Email', Icons.email),
            _buttonSubmit(context)
          ],
        ),
      ),
    );
  }

  _textField(String title, IconData icon) {
    return TextFormField(
      decoration: InputDecoration(
        icon: Icon(icon),
        labelText: title,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, preencher "${title.toLowerCase()}"';
        }
        return null;
      },
    );
  }

  _buttonSubmit(context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ElevatedButton.icon(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Cadastrando...'),
              ),
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
