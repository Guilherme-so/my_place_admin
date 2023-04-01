import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../widgets/loading.dart';
import '../../widgets/logo.dart';
import 'sign_up_controller.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _controller = SignUpController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: SizedBox(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: _controller.isLoading
                ? const Loading()
                : Column(
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
                        onSaved: (nome) => _controller.setNome(nome!),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.email),
                          labelText: 'Email',
                        ),
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              !value.contains('@')) {
                            return 'Preencha um email valido!';
                          } else {
                            return null;
                          }
                        },
                        onSaved: (email) => _controller.setEmail(email!),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.remove_red_eye_rounded),
                            onPressed: () {
                              setState(() {
                                _controller.setToogleVersenha();
                              });
                            },
                          ),
                          labelText: 'Senha',
                        ),
                        obscureText: _controller.verSenha,
                        validator: (value) {
                          if (value == null ||
                              value.isEmpty ||
                              value.length < 8) {
                            return "Insira uma senha valida com pelo menos 8 caracters";
                          } else {
                            return null;
                          }
                        },
                        onChanged: (newValue) => _controller.setSenha(newValue),
                        onSaved: (senha) => _controller.setSenha(senha!),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  _controller.setToogleComfirmarSenha();
                                });
                              },
                              icon: const Icon(Icons.remove_red_eye_rounded)),
                          labelText: 'Confirmar senha',
                        ),
                        obscureText: _controller.verComfirmaSenha,
                        validator: (value) => _controller.validadeSenha(value!),
                        onSaved: (confirmaSenha) =>
                            _controller.setComfirmarSenha(confirmaSenha!),
                      ),
                      const SizedBox(height: 20),
                      if (_controller.error.isNotEmpty) Text(_controller.error),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: 120,
                        child: OutlinedButton(
                          onPressed: () async {
                            final form = _formKey.currentState!;
                            if (form.validate()) {
                              form.save();
                              try {
                                setState(() {
                                  _controller.setIsLoading(true);
                                });
                                await _controller.criarUsuario();
                                setState(() {
                                  _controller.setIsLoading(false);
                                });
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  setState(() {
                                    _controller.setError(
                                        'The password provided is too weak.');
                                    _controller.setIsLoading(false);
                                  });
                                } else if (e.code == 'email-already-in-use') {
                                  setState(() {
                                    _controller.setError(
                                        'The account already exists for that email.');
                                    _controller.setIsLoading(false);
                                  });
                                }
                              }
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
      ),
    ));
  }
}
