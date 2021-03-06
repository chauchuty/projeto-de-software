import 'package:flutter_refactoring/models/servico.model.dart';

abstract class IServicoRepository {
  List<Servico> getAll();
  Servico getOne(int id);
  int insert(Servico servico);
  Servico update(Servico servico);
  void delete(int id);
}

class ServicoRepository implements IServicoRepository {
  final List<Servico> servicos = [
    Servico(
        id: 0,
        nome: 'Corte Curto',
        descricao: 'Duração de 40 min',
        valor: 30.00),
    Servico(
        id: 1,
        nome: 'Corte Longo',
        descricao: 'Duração de 1h20 min',
        valor: 50.00),
    Servico(id: 2, nome: 'Alisamento', descricao: 'Sem formol', valor: 60.00),
    Servico(
        id: 3,
        nome: 'Hidratação',
        descricao: 'Produtos boticário',
        valor: 65.00),
  ];

  @override
  List<Servico> getAll() {
    return servicos;
  }

  @override
  Servico getOne(int id) {
    return servicos[id];
  }

  @override
  int insert(Servico servico) {
    servico.id = servicos[servicos.length].id;
    servicos.add(servico);
    return servico.id!;
  }

  @override
  update(data) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  void delete(int id) {
    servicos.removeAt(id);
  }
}
