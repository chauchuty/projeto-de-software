import 'package:flutter/material.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.50,
      child: Drawer(
        child: ListView(
          children: [
            _listTile(title: 'Home', icon: Icons.home),
            _listTile(title: 'Agendamento', icon: Icons.calendar_month),
            _listTile(title: 'Clientes', icon: Icons.people),
            _listTile(title: 'Serviços', icon: Icons.work),
            _listTile(title: 'Pacotes', icon: Icons.widgets),
            _listTile(title: 'Financeiro', icon: Icons.account_balance),
            _listTile(title: 'Sair', icon: Icons.exit_to_app),
          ],
        ),
      ),
    );
  }

  _listTile({
    required String title,
    required IconData icon,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        print('Helo');
      },
    );
  }
}
