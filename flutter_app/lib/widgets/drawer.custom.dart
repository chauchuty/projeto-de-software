import 'package:flutter/material.dart';

class ListTileCustom {
  static feature(String title) {
    return ListTile(
      title: Text(title),
      textColor: Colors.black,
      onTap: () {
        // Navigator.push('/page');
      },
    );
  }
}

class DrawerCustom {
  static feature() {
    return Drawer(
      child: ListView(
        children: [
          ListTileCustom.feature('Home'),
          ListTileCustom.feature('Cliente'),
          ListTileCustom.feature('Serviços'),
          ListTileCustom.feature('Agendamento'),
        ],
      ),
    );
  }
}
