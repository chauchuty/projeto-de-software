import 'package:flutter/material.dart';
import 'package:flutter_refactoring/components/cliente.modal.dart';
import 'package:flutter_refactoring/models/cliente.model.dart';
import 'package:flutter_refactoring/repositories/clientes.repository.dart';
import 'package:flutter_refactoring/widgets/app.bar.custom.dart';
import 'package:flutter_refactoring/widgets/drawer.custom.dart';

class ClientesPage extends StatelessWidget {
  final ClienteRepository repository = ClienteRepository();

  ClientesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(title: 'Clientes'),
      drawer: const DrawerCustom(),
      body: _body(context),
      floatingActionButton: _floatingActionButton(),
    );
  }

  _body(context) {
    final clientes = repository.getAll();
    return ListView.builder(
      itemBuilder: (context, index) {
        return _listView(context, clientes[index]);
      },
      itemCount: clientes.length,
    );
  }

  _listView(context, Cliente cliente) {
    return Card(
      child: ListTile(
        onLongPress: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ClienteModal(cliente: cliente, editMode: false),
            ),
          );
        },
        leading: const Icon(
          Icons.account_box,
          size: 35,
        ),
        title: Text(cliente.nome),
        subtitle: Text(cliente.email),
        trailing: Wrap(
          children: [
            _actions(context, cliente),
          ],
        ),
      ),
    );
  }

  _floatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        // Add your onPressed code here!
      },
      child: const Icon(Icons.person_add),
    );
  }

  _actions(context, Cliente cliente) {
    return IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ClienteModal(cliente: cliente, editMode: true),
            ),
          );
        },
        icon: const Icon(Icons.edit),
        splashRadius: 20);
  }

  // _delete(context, Cliente cliente) {
  //   IconButton(
  //     onPressed: () {
  //       showDialog(
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             title: Text('Usuário: ${cliente.nome} (${cliente.id})'),
  //             content: Wrap(
  //               children: [
  //                 Wrap(
  //                   spacing: 10,
  //                   children: [
  //                     Icon(Icons.delete),
  //                     Text('Deseja realmente deleta?'),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //             actions: [
  //               ElevatedButton(
  //                 onPressed: () {},
  //                 child: Text('Cancelar'),
  //               ),
  //               ElevatedButton(
  //                 onPressed: () {},
  //                 child: Text('Deletar'),
  //               ),
  //             ],
  //           );
  //         },
  //       );
  //     },
  //     icon: const Icon(Icons.delete),
  //     splashRadius: 20,
  //   );

}
