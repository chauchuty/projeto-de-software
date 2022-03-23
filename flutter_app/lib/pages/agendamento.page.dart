import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/scaffold.custom.dart';

class AgendamentoPage extends StatelessWidget {
  const AgendamentoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom.feature(Text('Agendamento Page'));
  }
}
