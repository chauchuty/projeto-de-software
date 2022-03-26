import 'package:flutter/material.dart';
import 'package:flutter_app/pages/agendamento.page.dart';
import 'package:flutter_app/pages/clientes.page.dart';
import 'package:flutter_app/pages/home.page.dart';
import 'package:flutter_app/pages/pacotes.page.dart';
import 'package:flutter_app/pages/relatorio.page.dart';
import 'package:flutter_app/pages/servicos.page.dart';

class AppBarCustom extends StatefulWidget {
  final Function callback;
  const AppBarCustom({Key? key, required this.callback}) : super(key: key);

  @override
  _AppBarCustomState createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  Widget page = const HomePage();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _leading(),
      title: _title('Salão de Beleza'),
      actions: _actions(),
      bottom: PreferredSize(
        preferredSize: const Size(0, 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _item(Icons.home, const HomePage(), widget.callback),
            _item(Icons.people, const ClientesPage(), widget.callback),
            _item(Icons.event_note, const AgendamentoPage(), widget.callback),
            _item(Icons.content_cut, const ServicosPage(), widget.callback),
            _item(Icons.grid_view, const PacotesPage(), widget.callback),
            _item(Icons.account_balance_wallet, const RelatorioPage(),
                widget.callback),
          ],
        ),
      ),
    );
  }

  _title(String title) {
    return Center(
      child: Text(title),
    );
  }

  _leading() {
    return IconButton(
      onPressed: () {},
      splashRadius: 20,
      icon: const Icon(Icons.person),
    );
  }

  _actions() {
    return [
      IconButton(
        onPressed: () {},
        splashRadius: 20,
        icon: const Icon(Icons.more_vert),
      ),
    ];
  }

  _item(IconData icon, Widget widget, Function callback) {
    return IconButton(
      onPressed: () {
        callback(widget);
      },
      splashRadius: 20,
      icon: Icon(
        icon,
        color: Colors.white,
      ),
    );
  }
}
