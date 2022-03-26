import 'package:flutter/material.dart';
import 'package:flutter_app/pages/clientes.page.dart';

class MenuBar extends StatefulWidget {
  const MenuBar({Key? key}) : super(key: key);

  @override
  _MenuBarState createState() => _MenuBarState();
}

class _MenuBarState extends State<MenuBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[400],
      height: 75,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _icons(Icons.home, label: 'Home'),
          _icons(Icons.people_alt, label: 'Clientes'),
          _icons(Icons.cleaning_services, label: 'Serviços'),
          _icons(Icons.widgets, label: 'Pacotes'),
          _icons(Icons.summarize, label: 'Relatório')
        ],
      ),
    );
  }

  _icons(IconData icon, {String label = ""}) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: IconButton(
        icon: Icon(icon),
        iconSize: 25,
        tooltip: label,
        color: Colors.white,
        onPressed: () {},
      ),
    );
  }
}
