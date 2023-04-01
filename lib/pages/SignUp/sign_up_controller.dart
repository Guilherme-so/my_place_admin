// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/Exceptions/email_already_exists_exception.dart';
import '../../core/Exceptions/email_invalid_exception.dart';
import '../../core/Exceptions/weak_password_exception.dart';

class SignUpController {
  final _firebaseAuth = FirebaseAuth.instance;
  final _userRef = FirebaseFirestore.instance.collection('usuarios');

  String _nome = '';
  String _email = '';
  String _senha = '';
  String _confirmaSenha = '';

  bool _verSenha = true;
  bool _verComfirmaSenha = true;
  bool _isLoading = false;

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

  Future<void> criarUsuario() async {
    try {
      final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
          email: _email, password: _senha);

      await _userRef.doc(credentials.user?.uid).set(
        {
          'nome': _nome,
          'email': _email,
          'tipo': "ADMIN",
        },
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        throw EmailInvalid();
      } else if (e.code == 'weak-password') {
        throw WeakPasswordException();
      } else if (e.code == 'email-already-in-use') {
        throw EmailAlreadyExists();
      } else {
        rethrow;
      }
    }
  }

  void setNome(String nome) => _nome = nome;
  void setEmail(String email) => _email = email;
  void setSenha(String senha) => _senha = senha;
  void setComfirmarSenha(String comfirmarSenha) =>
      _confirmaSenha = comfirmarSenha;
  void setIsLoading(bool loading) => _isLoading = loading;

  void setToogleVersenha() => _verSenha = !_verSenha;
  void setToogleComfirmarSenha() => _verComfirmaSenha = !_verComfirmaSenha;

  bool get isLoading => _isLoading;
  bool get verSenha => _verSenha;
  bool get verComfirmaSenha => _verComfirmaSenha;
}
