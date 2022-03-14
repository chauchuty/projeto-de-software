import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';

void main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Projeto de Software',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const HomePage(title: 'Gestão de Salão de Beleza'),
      debugShowCheckedModeBanner: false,
    );
  }
}
