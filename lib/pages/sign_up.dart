import 'package:flutter/material.dart';

import '../widgets/logo.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  late String _nome;
  late String _email;
  late String _senha;
  late String _confirmaSenha;

  bool verSenha = true;
  bool verComfirmaSenha = true;

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
                  prefixIcon: Icon(Icons.person),
                  labelText: 'Nome',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Preencha seu nome!';
                  } else {
                    return null;
                  }
                },
                onSaved: (nome) => _nome = nome!,
              ),
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
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.remove_red_eye_rounded),
                    onPressed: () {
                      setState(() {
                        verSenha = !verSenha;
                      });
                    },
                  ),
                  labelText: 'Senha',
                ),
                obscureText: verSenha,
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 8) {
                    return "Insira uma senha valida com pelo menos 8 caracters";
                  } else {
                    return null;
                  }
                },
                onChanged: (newValue) => _senha = newValue,
                onSaved: (senha) => _senha = senha!,
              ),
              const SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          verComfirmaSenha = !verComfirmaSenha;
                        });
                      },
                      icon: const Icon(Icons.remove_red_eye_rounded)),
                  labelText: 'Confirmar senha',
                ),
                obscureText: verComfirmaSenha,
                validator: (value) => validadeSenha(value!),
                onSaved: (confirmaSenha) => _confirmaSenha = confirmaSenha!,
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 120,
                child: OutlinedButton(
                  onPressed: () {
                    final form = _formKey.currentState!;
                    if (form.validate()) {
                      form.save();
                      print(_nome);
                      print(_email);
                      print(_senha);
                      print(_confirmaSenha);
                    }
                  },
                  child: const Text("Confirmar"),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 120,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text("Voltar"),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  validadeSenha(String confirmSenha) {
    if (confirmSenha.isEmpty) {
      return "Confirme sua senha";
    }
    if (confirmSenha != _senha) {
      return 'Senha deve ser igual!';
    } else {
      return null;
    }
  }
}
