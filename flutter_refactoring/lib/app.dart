import 'package:flutter/material.dart';
import 'package:flutter_refactoring/custom/theme_data.dart';
import 'package:flutter_refactoring/main.dart';
import 'package:flutter_refactoring/routes/routes.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _materialApp();
  }

  _materialApp() {
    return MaterialApp(
      title: 'Salão de Beleza - UTFPR',
      initialRoute: RoutesCustom.initialRoute(),
      routes: RoutesCustom.feature(),
      theme: ThemeDataCustom.light(),
      debugShowCheckedModeBanner: false,
    );
  }
}
