import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF6E3CBC), Color(0xFF7267CB)]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: _body(context),
      ),
    );
  }

  _body(context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: const BoxDecoration(
              image: DecorationImage(
                scale: 1.2,
                image: AssetImage('assets/images/logo.png'),
              ),
            ),
          ),
          const SizedBox(
            height: 120,
            child: Text(
              'Bem Vindo(a) ao Hair Salon',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: ElevatedButton(
              child: const Padding(
                padding: EdgeInsets.all(10.0),
                child: Text(
                  "Login",
                  style: TextStyle(fontSize: 22),
                ),
              ),
              onPressed: () {},
            ),
          ),
          Container(
            alignment: Alignment.bottomCenter,
            child: const Text(
              'Não é cadastrado?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
