import 'package:flutter_refactoring/models/cliente.model.dart';
import 'package:flutter_refactoring/models/servico.model.dart';

class Agendamento {
  int? id;
  String? descricao;
  DateTime dataInicio;
  DateTime dataFim;
  Cliente cliente;
  Servico servico;

  Agendamento({
    this.id,
    this.descricao,
    required this.dataInicio,
    required this.dataFim,
    required this.cliente,
    required this.servico,
  });
}
