import 'package:flutter/material.dart';

class DrawerComponent extends StatelessWidget {
  const DrawerComponent({Key? key}) : super(key: key);

  // This widget is the root of your DrawerComponentlication.
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          ListTile(
            title: TextButton(
              child: const Text('Home'),
              onPressed: () {
                Navigator.pushNamed(context, '/');
              },
            ),
          ),
          ListTile(
            title: TextButton(
              child: const Text('Clientes'),
              onPressed: () {
                Navigator.pushNamed(context, '/clientes');
              },
            ),
          ),
          ListTile(
            title: TextButton(
              child: const Text('Produtos'),
              onPressed: () {
                Navigator.pushNamed(context, '/produtos');
              },
            ),
          ),
        ],
      ),
    );
  }
}
