import 'package:flutter/material.dart';
import 'package:flutter_app/compoments/drawer.component.dart';

class ProdutosPage extends StatefulWidget {
  const ProdutosPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ProdutosPage> createState() => _ProdutosPageState();
}

class _ProdutosPageState extends State<ProdutosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      drawer: const DrawerComponent(),
      body: const Center(
        child: Text("Produtos"),
      ),
    );
  }
}
