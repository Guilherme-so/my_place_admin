import 'package:flutter/material.dart';
import 'package:my_place_admin/pages/SignIn/sign_in_controller.dart';
import '../../core/Exceptions/SignInExceptions/invalid_email_exception.dart';
import '../../core/Exceptions/SignInExceptions/not_admin_exception.dart';
import '../../core/Exceptions/SignInExceptions/user_not_found_exception.dart';
import '../../core/Exceptions/SignInExceptions/wrong_password_exception.dart';
import '../../widgets/loading.dart';
import '../../widgets/logo.dart';
import '../../widgets/toasts/toasts.utils.dart';
import '../Home/home_page.dart';
import '../SignUp/sign_up.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final _signInController = SignInController();

  bool _verSenha = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Form(
      key: _formKey,
      child: SizedBox(
        child: _signInController.isLoading
            ? const Center(
                child: Loading(),
              )
            : Padding(
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
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains('@')) {
                          return 'Preencha um email valido!';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (email) => _signInController.setEmail(email!),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              _verSenha = !_verSenha;
                            });
                          },
                          icon: const Icon(Icons.remove_red_eye),
                        ),
                        labelText: 'Senha',
                      ),
                      obscureText: _verSenha,
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length < 8) {
                          return "Insira uma senha valida com pelo menos 8 caracters";
                        } else {
                          return null;
                        }
                      },
                      onSaved: (senha) => _signInController.setSenha(senha!),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 120,
                      child: OutlinedButton(
                        onPressed: () async {
                          final form = _formKey.currentState!;
                          if (form.validate()) {
                            form.save();
                            setState(() {
                              _signInController.setIsLoading(true);
                            });
                            try {
                              await _signInController.fazLogin();
                              showSuccessToast('Logado com sucesso.');
                              if (context.mounted) {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => const HomePage()));
                              }
                            } on NotAdmin {
                              showWarningToast('Voce nao tem permisao de adm.');
                            } on UserNotFound {
                              showWarningToast('Usuario nao encontrado.');
                            } on WrongPassword {
                              showWarningToast('Senha incorreta.');
                            } on InvalidEmail {
                              showWarningToast("Email invalido");
                            } on Exception {
                              showErrorToast(
                                  "Algo deu errado tente novamente.");
                            } finally {
                              setState(() {
                                _signInController.setIsLoading(false);
                              });
                            }
                          }
                        },
                        child: const Text("Entrar"),
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: 120,
                      child: OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => const SignUpPage(),
                          ));
                        },
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
