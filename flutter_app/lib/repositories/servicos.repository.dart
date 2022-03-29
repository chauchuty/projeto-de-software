import 'package:dio/dio.dart';
import 'package:flutter_app/models/servicos.model.dart';

abstract class IServicoRepository {
  Future<List<Servico>> getAll();
  Future<Servico?> getOne(int id);
  Future<void> insert(Servico servico);
  Future<void> update(Servico servico);
  Future<void> delete(int id);
}

class ServicoRepository implements IServicoRepository {
  @override
  Future<List<Servico>> getAll() async {
    var response = await Dio().get('http://localhost:3000/servicos');
    return (response.data as List).map((e) => Servico.fromMap(e)).toList();
  }

  @override
  Future<Servico?> getOne(int id) async {
    var response = await Dio().get('http://localhost:3000/servicos/$id');
    return Servico.fromMap(response.data);
  }

  @override
  Future<Servico> insert(Servico servico) async {
    var response = await Dio().post(
      'http://localhost:3000/servicos/',
      data: {
        'nome': servico.nome,
        'valor': servico.valor,
        'descricao': servico.descricao
      },
    );
    return Servico.fromMap(response.data);
  }

  @override
  Future<void> update(Servico servico) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
