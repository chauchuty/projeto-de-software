import 'package:flutter/material.dart';
import 'package:flutter_refactoring/utilities/snackbar.dart';
import 'package:flutter_refactoring/utilities/validate.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _userC = TextEditingController();
  final _passC = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _body(),
    );
  }

  _appBar() {
    return AppBar(
      centerTitle: true,
      title: const Text('Área de Acesso'),
      elevation: 0,
    );
  }

  _body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo.png'),
        const SizedBox(height: 30),
        _form(),
      ],
    );
  }

  _form() {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 20),
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            _textFormField(
                label: 'Usuário',
                controller: _userC,
                validator: ValidateCustom.isUser),
            _textFormField(
                label: 'Senha',
                controller: _passC,
                validator: ValidateCustom.isPass,
                obscureText: true),
            const SizedBox(height: 10),
            _buttonSubmit()
          ],
        ),
      ),
    );
  }

  _textFormField(
      {required String label,
      required TextEditingController controller,
      required Function validator,
      bool obscureText = false}) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (!validator(value)) {
          return 'Campo "$label" inválido!';
        }
        return null;
      },
      obscureText: obscureText,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        label: Text(label),
      ),
    );
  }

  _buttonSubmit() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Validação Provisória
          if (_userC.text == 'admin' && _passC.text == '010203') {
            SnackBarCustom.success(context, message: 'Logado com sucesso!');

            Navigator.pushNamed(context, '/home');
            return;
          }
          _passC.clear();
          SnackBarCustom.error(context, message: 'Usuário ou senha inválido!');
        }
      },
      child: const Text('Acessar'),
    );
  }
}
