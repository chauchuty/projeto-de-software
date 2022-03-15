import 'package:flutter/material.dart';
import 'package:flutter_app/pages/clientes.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/produtos.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto de Software',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(title: 'Gestão de Salão de Beleza'),
        '/clientes': (context) => const ClientesPage(title: 'Clientes'),
        '/produtos': (context) => const ProdutosPage(title: 'Produtos'),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
