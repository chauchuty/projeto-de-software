import 'dart:convert';

import 'package:flutter_refactoring/models/servico.model.dart';

class Pacote {
  int? id;
  String nome;
  String? descricao;
  List<Servico> servicos;

  Pacote({
    this.id,
    required this.nome,
    this.descricao,
    required this.servicos,
  });
}
