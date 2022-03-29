import 'package:flutter/material.dart';
import 'package:flutter_app/utilities/utility.dart';

class FormCustom extends StatefulWidget {
  final String title;
  final dynamic dataField;
  final dynamic repository;
  final dynamic instance;
  const FormCustom({
    Key? key,
    required this.title,
    required this.dataField,
    required this.repository,
    required this.instance,
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
        child: Column(
          children: [...dataField, _buttonSubmit(context)],
        ),
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
          return Utility.validator(value, df['type'], df['opcional']);
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

            widget.dataField.forEach((e) {
              print(e['type']);
              print(e['name']);
              print(e['controller'].text);

              if (e['type'] == 'number') {
                widget.instance.propDynamic(
                    e['name'], double.tryParse(e['controller'].text));
              } else {
                widget.instance.propDynamic(e['name'], e['controller'].text) ??
                    '';
              }
            });

            widget.repository.insert(widget.instance);

            FocusManager.instance.primaryFocus?.unfocus();
          }
        },
        icon: const Icon(Icons.add),
        label: const Text('Cadastrar'),
      ),
    );
  }
}
