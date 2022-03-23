import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.page.dart';

class RoutesCustom {
  static feature() {
    return <String, WidgetBuilder>{
      '/': (context) => const HomePage(title: 'Home'),
      // '/clientes': (context) => const ClientePage(
      //       title: 'Clientes',
      //     ),
      // '/agendamento': (context) => const ServicosPage(
      //       title: 'Agendamento',
      //     ),
      // '/servicos': (context) => const ServicosPage(
      //       title: 'Serviços',
      //     ),
      // '/pacotes': (context) => const PacotesPage(
      //       title: 'Pacotes',
      //     ),
      // '/financeiro': (context) => const AgendamentoPage(
      //       title: 'Financeiro',
      //     ),
    };
  }
}
