import 'package:flutter/material.dart';
import '../widgets/logo.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _senha;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email),
                  labelText: 'Email',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Preencha um email valido!';
                  } else {
                    return null;
                  }
                },
                onSaved: (email) => _email = email!,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password),
                  labelText: 'Senha',
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 8) {
                    return "Insira uma senha valida com pelo menos 8 caracters";
                  } else {
                    return null;
                  }
                },
                onSaved: (senha) => _senha = senha!,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 120,
                child: OutlinedButton(
                  onPressed: () {
                    final form = _formKey.currentState!;
                    if (form.validate()) {
                      form.save();
                      print(_email);
                      print(_senha);
                    }
                  },
                  child: const Text("Entrar"),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 120,
                child: OutlinedButton(
                  onPressed: () {},
                  child: const Text("Cadastrar"),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
