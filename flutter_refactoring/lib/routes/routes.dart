import 'package:flutter_refactoring/pages/agendamentos.page.dart';
import 'package:flutter_refactoring/pages/clientes.page.dart';
import 'package:flutter_refactoring/pages/home.page.dart';
import 'package:flutter_refactoring/pages/login.page.dart';
import 'package:flutter_refactoring/pages/servicos.page.dart';

class RoutesCustom {
  static initialRoute() => '/login';

  static feature() {
    return {
      '/login': (context) => const LoginPage(),
      '/home': (context) => const HomePage(),
      '/agendamento': (context) => AgendamentosPage(),
      '/clientes': (context) => ClientesPage(),
      '/servicos': (context) => ServicosPage(),
      // '/pacotes': (context) => PacotesPage(),
      // '/financeiro': (context) => const FinanceiroPage(),
    };
  }
}
