import 'package:flutter_refactoring/models/cliente.model.dart';

abstract class IClienteRepository {
  List<Cliente> getAll();
  Cliente getOne(int id);
  int insert(Cliente cliente);
  Cliente update(Cliente cliente);
  void delete(int id);
}

class ClienteRepository implements IClienteRepository {
  final List<Cliente> clientes = [
    Cliente(
      id: 0,
      nome: 'Cesar M. Chauchuty',
      telefone: '42 9 9999 9999',
      email: 'chauchuty@alunos.utfpr.edu.br',
    ),
    Cliente(
      id: 1,
      nome: 'Jucinaldo Araujo',
      telefone: '42 9 8888 8888',
      email: 'jucinaldo@alunos.utfpr.edu.br',
    ),
    Cliente(
      id: 2,
      nome: 'Murilo Szulha',
      telefone: '42 9 7777 7777',
      email: 'murilo@alunos.utfpr.edu.br',
    ),
    Cliente(
      id: 3,
      nome: 'Marcos Soek',
      telefone: '42 9 6666 6666',
      email: 'chauchuty@alunos.utfpr.edu.br',
    ),
  ];

  @override
  List<Cliente> getAll() {
    return clientes;
  }

  @override
  Cliente getOne(int id) {
    return clientes[id];
  }

  @override
  int insert(Cliente cliente) {
    cliente.id = clientes[clientes.length].id;
    clientes.add(cliente);
    return cliente.id!;
  }

  @override
  update(data) {
    // TODO: implement update
    throw UnimplementedError();
  }

  @override
  void delete(int id) {
    clientes.removeAt(id);
  }
}
