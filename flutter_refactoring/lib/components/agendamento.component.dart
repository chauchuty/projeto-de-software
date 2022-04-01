import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_refactoring/models/agendamento.model.dart';
import 'package:flutter_refactoring/models/cliente.model.dart';
import 'package:flutter_refactoring/repositories/cliente.repository.dart';
import 'package:flutter_refactoring/utilities/snackbar.dart';
import 'package:flutter_refactoring/utilities/validate.dart';
import 'package:flutter_refactoring/widgets/app.bar.custom.dart';
import 'package:intl/intl.dart';

class AgendamentoComponent extends StatefulWidget {
  // Settings
  final String title;
  final String mode;
  final Agendamento? agendamento;

  const AgendamentoComponent({
    Key? key,
    required this.title,
    required this.mode,
    this.agendamento,
  }) : super(key: key);

  @override
  State<AgendamentoComponent> createState() => _AgendamentoModalState();
}

class _AgendamentoModalState extends State<AgendamentoComponent> {
  final _formKey = GlobalKey<FormState>();
  final _nomeC = TextEditingController();
  final _telefoneC = TextEditingController();
  final _emailC = TextEditingController();

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
        return _read(context, agendamento: widget.agendamento);
      case 'update':
        return _update(context, agendamento: widget.agendamento);
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
            Icons.person_add,
            size: 75,
          ),
          _itemDropButton(),
          _itemCreate(
            'Descrição',
            Icons.description,
            _emailC,
          ),
          const SizedBox(height: 10),
          Wrap(
            alignment: WrapAlignment.center,
            children: [
              SizedBox(
                child: _itemDatePicker(context, 'Início'),
                width: MediaQuery.of(context).size.width * 0.45,
              ),
              const SizedBox(width: 10),
              SizedBox(
                child: _itemDatePicker(context, 'Fim'),
                width: MediaQuery.of(context).size.width * 0.45,
              ),
            ],
          ),
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

  _read(context, {Agendamento? agendamento}) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        const Icon(
          Icons.calendar_month,
          size: 75,
        ),
        _itemRead(agendamento!.id.toString(), Icons.numbers),
        _itemRead(agendamento.cliente.nome, Icons.person),
        _itemRead(agendamento.descricao, Icons.description),
        _itemRead(
            "Início: " +
                DateFormat("kk:mm / dd-MM-yyyy").format(agendamento.dataInicio),
            Icons.schedule),
        _itemRead(
            "Fim: " +
                DateFormat("kk:mm / dd-MM-yyyy").format(agendamento.dataFim),
            Icons.schedule),
      ],
    );
  }

  _itemRead(String? title, IconData icon) {
    return Card(
      child: ListTile(
        leading: Icon(icon),
        title: Text(title!),
      ),
    );
  }

  _update(context, {Agendamento? agendamento}) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        const Icon(
          Icons.manage_accounts,
          size: 75,
        ),
        _itemUpdate(agendamento!.descricao, Icons.person),
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

  _itemDropButton() {
    ClienteRepository repository = ClienteRepository();
    List<Cliente> clientes = repository.getAll();

    return DropdownButtonFormField<Cliente>(
      decoration: const InputDecoration(
        prefixIcon: Icon(Icons.person),
      ),
      value: clientes[0],
      onChanged: (value) {},
      selectedItemBuilder: (BuildContext context) {
        return clientes.map((Cliente cliente) {
          return Text(cliente.nome);
        }).toList();
      },
      items: clientes.map((Cliente cliente) {
        return DropdownMenuItem<Cliente>(
          value: cliente,
          child: Text(cliente.nome),
        );
      }).toList(),
    );
  }

  String initialDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  _itemDatePicker(context, String label) {
    FocusScope.of(context).requestFocus(FocusNode());
    return TextFormField(
      initialValue: initialDate,
      onChanged: (value) {},
      onTap: () {
        DatePicker.showDatePicker(context,
            showTitleActions: true,
            minTime: DateTime.now(),
            onChanged: (date) {}, onConfirm: (date) {
          setState(() {
            initialDate = '';
          });
          FocusScope.of(context).requestFocus(FocusNode());
        }, currentTime: DateTime.now(), locale: LocaleType.pt);
      },
    );
  }

  _itemUpdate(String? title, IconData icon) {
    return TextFormField(
      initialValue: title,
      decoration: InputDecoration(icon: Icon(icon)),
    );
  }
}
