import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({Key? key}) : super(key: key);

  @override
  _AppBarCustomState createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Padding(
        padding: EdgeInsets.only(top: 10),
        child: Center(
          child: Text(
            'Salão de Beleza',
          ),
        ),
      ),
      leading: const Padding(
        padding: EdgeInsets.only(top: 10, left: 10),
        child: CircleAvatar(
          foregroundColor: Colors.white,
          backgroundColor: Color.fromRGBO(255, 205, 210, 0.3),
          child: Icon(
            Icons.person,
          ),
        ),
      ),
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(Icons.exit_to_app),
        )
      ],
      shadowColor: Colors.transparent,
    );
  }
}
