import 'package:flutter/material.dart';
import 'package:flutter_app/compoments/drawer.component.dart';

class ClientesPage extends StatefulWidget {
  const ClientesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ClientesPage> createState() => _ClientesPageState();
}

class _ClientesPageState extends State<ClientesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        drawer: const DrawerComponent(),
        body: Center(
          child: Column(
            children: [
              Row(
                children: const <Widget>[
                  Expanded(
                    child: Text('Deliver features faster',
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: Text('Craft beautiful UIs',
                        textAlign: TextAlign.center),
                  ),
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.contain, // otherwise the logo will be tiny
                      child: FlutterLogo(),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
