import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Salão de Beleza',
        theme: ThemeData(
          primarySwatch: Colors.deepPurple,
        ),
        home: const Center());
  }
}
