import 'package:flutter/material.dart';
import 'package:flutter_app/pages/agendamento.page.dart';
import 'package:flutter_app/pages/cliente.page.dart';
import 'package:flutter_app/pages/home.page.dart';
import 'package:flutter_app/pages/servicos.page.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salão de Beleza',
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/clientes': (context) => const ClientePage(),
        '/servicos': (context) => const ServicosPage(),
        '/agendamento': (context) => const AgendamentoPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
