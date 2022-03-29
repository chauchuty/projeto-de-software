import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_app/models/cliente.model.dart';

abstract class IClienteRepository {
  Future<List<Cliente>> getAll();
  Future<Cliente?> getOne(int id);
  Future<void> insert(Cliente cliente);
  Future<void> update(Cliente cliente);
  Future<void> delete(int id);
}

class ClienteRepository implements IClienteRepository {
  @override
  Future<List<Cliente>> getAll() async {
    var response = await Dio().get('http://localhost:3000/clientes');
    return (response.data as List).map((e) => Cliente.fromMap(e)).toList();
  }

  @override
  Future<Cliente?> getOne(int id) async {
    var response = await Dio().get('http://localhost:3000/clientes/$id');
    return Cliente.fromMap(response.data);
  }

  @override
  Future<void> insert(Cliente cliente) {
    // TODO: implement insert
    throw UnimplementedError();
  }

  @override
  Future<void> update(Cliente cliente) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  Future<void> delete(int id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
