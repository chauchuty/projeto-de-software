import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/scaffold.custom.dart';

class ClientePage extends StatelessWidget {
  const ClientePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom.feature(Text('Cliente Page'));
  }
}
