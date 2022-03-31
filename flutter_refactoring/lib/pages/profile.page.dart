import 'package:flutter/material.dart';
import 'package:flutter_refactoring/widgets/app.bar.custom.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarCustom(
        title: 'Perfil',
        visibleActions: false,
      ),
      // drawer: const DrawerCustom(),
      body: Container(),
    );
  }
}
