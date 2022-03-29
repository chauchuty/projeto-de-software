import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

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
            // _textField('Nome', Icons.person, 'string'),
            // _textField('Data', Icons.date_range, 'date'),
            _textField('Telefone', Icons.phone, 'phone'),
            _textField('Email', Icons.email, 'email'),
            _buttonSubmit(context)
          ],
        ),
      ),
    );
  }

  _textField(String title, IconData icon, String type) {
    return TextFormField(
      inputFormatters: [_mask(type)],
      decoration: InputDecoration(
        icon: Icon(icon),
        labelText: title,
      ),
      validator: (value) {
        return _validator(value, type);
      },
    );
  }

  _mask(String type) {
    var rules = <String, dynamic>{
      'string': {
        'mask': '#############################',
        'filter': RegExp(r"[A-Za-z ]"),
      },
      'date': {
        'mask': '##/##/####',
        'filter': RegExp(r"[0-9]"),
      },
      'phone': {
        'mask': '## # #### ####',
        'filter': RegExp(r"[0-9]"),
      },
      'email': {
        'mask': '##############################',
        'filter': RegExp(r"[a-z0-9@.]"),
      }
    };

    return MaskTextInputFormatter(
        mask: rules[type]!['mask'],
        filter: {"#": rules[type]!['filter']},
        type: MaskAutoCompletionType.lazy);
  }

  _validator(value, type) {
    // recebe valor e o *tipo*
    var rules = <String, dynamic>{
      'date': {
        'regex': r'(^(?:[+0]9)?[0-9]{10,12}$)',
      },
      'phone': {
        'regex': r'(^(?:[+0]9)?[0-9]{10,12}$)',
      },
      'email': {
        'regex':
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
      }
    };

    if (value == null || value.isEmpty) {
      return 'Por favor, preencher';
    }

    // if (!RegExp(rules[type]['regex']).hasMatch(value)) {
    //   return 'Campo Inválido!';
    // }

    // // Email
    // if (type == 'email' && !value.contains("@")) {
    //   return 'Email inválido!';
    // }

    return null;
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
