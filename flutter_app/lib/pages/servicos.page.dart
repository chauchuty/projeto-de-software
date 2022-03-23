import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/scaffold.custom.dart';

class ServicosPage extends StatelessWidget {
  const ServicosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom.feature(Text('Serviços Page'));
  }
}
