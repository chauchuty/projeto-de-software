import 'package:flutter_refactoring/models/agendamento.model.dart';
import 'package:flutter_refactoring/models/cliente.model.dart';
import 'package:flutter_refactoring/models/servico.model.dart';
import 'package:intl/intl.dart';

abstract class IAgendamentoRepository {
  List<Agendamento> getAll();
  Agendamento getOne(int id);
  int insert(Agendamento agendamento);
  Agendamento update(Agendamento agendamento);
  void delete(int id);
}

class AgendamentoRepository implements IAgendamentoRepository {
  final List<Agendamento> agendamentos = [
    Agendamento(
      id: 0,
      descricao: 'Deixar o cabelo lindo!',
      // dataInicio: '2022-04-01 15:00:00Z',
      dataInicio: DateTime.parse("2022-04-01 15:00"),
      dataFim: DateTime.parse("2022-04-01 16:30"),
      cliente: Cliente(
        id: 0,
        nome: 'Cesar M. Chauchuty',
        telefone: '42 9 9999 9999',
        email: 'chauchuty@alunos.utfpr.edu.br',
      ),
      servico: Servico(
          id: 0,
          nome: 'Corte Curto',
          descricao: 'Duração de 40 min',
          valor: 30.00),
    ),
    Agendamento(
      id: 1,
      descricao: 'Desencravar o dedo do pé',
      dataInicio: DateTime.parse("2022-04-03 16:30"),
      dataFim: DateTime.parse("2022-04-03 18:00"),
      cliente: Cliente(
        id: 1,
        nome: 'Jucinaldo Araujo',
        telefone: '42 9 8888 8888',
        email: 'jucinaldo@alunos.utfpr.edu.br',
      ),
      servico: Servico(
        id: 3,
        nome: 'Hidratação',
        descricao: 'Produtos boticário',
        valor: 65.00,
      ),
    ),
    Agendamento(
      id: 2,
      descricao: 'Alisar o bigode',
      dataInicio: DateTime.parse("2022-04-05 13:30"),
      dataFim: DateTime.parse("2022-04-05 15:30"),
      cliente: Cliente(
        id: 2,
        nome: 'Murilo Szulha',
        telefone: '42 9 7777 7777',
        email: 'murilo@alunos.utfpr.edu.br',
      ),
      servico: Servico(
          id: 2, nome: 'Alisamento', descricao: 'Sem formol', valor: 60.00),
    ),
    Agendamento(
      id: 2,
      descricao: 'Hidratar os pelos do sovaco',
      dataInicio: DateTime.parse("2022-04-06 16:30"),
      dataFim: DateTime.parse("2022-04-06 17:30"),
      cliente: Cliente(
        id: 3,
        nome: 'Marcos Soek',
        telefone: '42 9 6666 6666',
        email: 'chauchuty@alunos.utfpr.edu.br',
      ),
      servico: Servico(
        id: 2,
        nome: 'Hidratar',
        descricao: 'Sem formol',
        valor: 60.00,
      ),
    ),
  ];

  @override
  List<Agendamento> getAll() {
    return agendamentos;
  }

  @override
  Agendamento getOne(int id) {
    return agendamentos[id];
  }

  @override
  int insert(Agendamento agendamento) {
    agendamento.id = agendamentos[agendamentos.length].id;
    agendamentos.add(agendamento);
    return agendamento.id!;
  }

  @override
  update(data) {
    throw UnimplementedError();
  }

  @override
  void delete(int id) {
    agendamentos.removeAt(id);
  }
}
