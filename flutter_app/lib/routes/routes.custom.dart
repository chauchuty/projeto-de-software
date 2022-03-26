import 'package:flutter_app/pages/clientes.page.dart';
import 'package:flutter_app/pages/home.page.dart';

class RoutesCustom {
  static initialRoute() {
    return '/';
  }

  static routes(context) {
    return {
      '/clientes': (context) => const ClientesPage(),
    };
  }
}
