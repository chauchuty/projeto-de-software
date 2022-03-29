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
  final String title = 'Hair Salon';
  int itemSelected = 0;

  Widget page = const HomePage();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: _leading(),
      title: _title(title),
      actions: _actions(),
      bottom: PreferredSize(
        preferredSize: const Size(0, 0),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Wrap(
            spacing: 10,
            children: [
              _item(Icons.home, const HomePage(), 0, widget.callback),
              _item(Icons.people, const ClientesPage(), 1, widget.callback),
              _item(Icons.event_note, const AgendamentoPage(), 2,
                  widget.callback),
              _item(
                  Icons.content_cut, const ServicosPage(), 3, widget.callback),
              _item(Icons.grid_view, const PacotesPage(), 4, widget.callback),
              _item(Icons.account_balance_wallet, const RelatorioPage(), 5,
                  widget.callback),
            ],
          ),
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
      Padding(
        padding: const EdgeInsets.only(right: 5),
        child: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
          splashRadius: 20,
        ),
      ),
    ];
  }

  _item(IconData icon, Widget widget, int index, Function callback) {
    return IconButton(
      onPressed: () {
        setState(() {
          itemSelected = index;
        });
        callback(widget);
      },
      icon: Icon(
        icon,
        color: itemSelected == index ? Colors.grey[850] : Colors.white,
        size: 24,
      ),
      splashRadius: 20,
    );
  }
}
