import 'package:flutter/material.dart';
import 'package:flutter_app/routes/routes.custom.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Salão de Beleza',
      initialRoute: '/',
      routes: RoutesCustom.feature(),
      debugShowCheckedModeBanner: false,
    );
  }
}
