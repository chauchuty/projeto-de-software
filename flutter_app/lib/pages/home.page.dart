import 'package:flutter/material.dart';
import 'package:flutter_app/repositories/carro.repository.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final carros = CarroRepository.lista;
  NumberFormat real = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Projeto Mobile'),
      ),
      body: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: SizedBox(
              child: Text(
                carros[index].nome,
              ),
              width: 200,
            ),
            title: Text(carros[index].ano),
            trailing: Text(real.format(carros[index].preco)),
          );
        },
        separatorBuilder: (context, index) => const Divider(
          color: Colors.grey,
          thickness: 0.3,
        ),
        itemCount: carros.length,
      ),
    );
  }
}
