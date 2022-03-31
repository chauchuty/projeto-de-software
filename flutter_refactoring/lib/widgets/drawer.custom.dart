import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class DrawerCustom extends StatelessWidget {
  const DrawerCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.50,
      child: Drawer(
        child: ListView(
          children: [
            _listTile(
              context,
              title: 'Home',
              icon: Icons.home,
              route: '/home',
            ),
            _listTile(
              context,
              title: 'Agendamento',
              icon: Icons.calendar_month,
              route: '/agendamento',
            ),
            _listTile(
              context,
              title: 'Clientes',
              icon: Icons.people,
              route: '/clientes',
            ),
            _listTile(
              context,
              title: 'Serviços',
              icon: Icons.work,
              route: '/servicos',
            ),
            _listTile(
              context,
              title: 'Pacotes',
              icon: Icons.widgets,
              route: '/pacotes',
            ),
            _listTile(context,
                title: 'Financeiro',
                icon: Icons.account_balance,
                route: '/financeiro'),
            _listTile(
              context,
              title: 'Sair',
              icon: Icons.exit_to_app,
              route: '/exit',
            ),
          ],
        ),
      ),
    );
  }

  _listTile(
    context, {
    required String title,
    required IconData icon,
    required String route,
  }) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      onTap: () {
        if (route == '/exit') SystemNavigator.pop();
        Navigator.pushNamed(context, route);
      },
    );
  }
}
