import 'package:flutter_refactoring/pages/agendamento.page.dart';
import 'package:flutter_refactoring/pages/clientes.page.dart';
import 'package:flutter_refactoring/pages/financeiro.dart';
import 'package:flutter_refactoring/pages/pacotes.page.dart';
import 'package:flutter_refactoring/pages/profile.page.dart';
import 'package:flutter_refactoring/pages/home.page.dart';
import 'package:flutter_refactoring/pages/login.page.dart';
import 'package:flutter_refactoring/pages/servicos.page.dart';

class RoutesCustom {
  static initialRoute() => '/login';

  static feature() {
    return {
      '/login': (context) => const LoginPage(),
      '/profile': (context) => const ProfilePage(),
      '/home': (context) => const HomePage(),
      '/agendamento': (context) => const AgendamentoPage(),
      '/clientes': (context) => const ClientesPage(),
      '/servicos': (context) => const ServicosPage(),
      '/pacotes': (context) => const PacotesPage(),
      '/financeiro': (context) => const FinanceiroPage(),
    };
  }
}
