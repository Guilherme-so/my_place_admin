import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/Exceptions/SignInExceptions/invalid_email_exception.dart';
import '../../core/Exceptions/SignInExceptions/not_admin_exception.dart';
import '../../core/Exceptions/SignInExceptions/user_not_found_exception.dart';
import '../../core/Exceptions/SignInExceptions/wrong_password_exception.dart';
import '../../core/Models/usuario_model.dart';

class SignInController {
  String _email = '';
  String _senha = '';
  bool _isLoading = false;

  setEmail(String email) => _email = email;
  setSenha(String senha) => _senha = senha;
  setIsLoading(bool isLoading) => _isLoading = isLoading;
  bool get isLoading => _isLoading;

  final _firebaseAuth = FirebaseAuth.instance;
  final _usuariosRef = FirebaseFirestore.instance.collection('usuarios');

  Future<UsuarioModel?> fazLogin() async {
    try {
      final credentials = await _firebaseAuth.signInWithEmailAndPassword(
          email: _email, password: _senha);

      final userFirestore = await _usuariosRef.doc(credentials.user?.uid).get();
      final user = UsuarioModel.fromJson(
          userFirestore.id, userFirestore.data() as Map<String, dynamic>);

      if (user.tipo != "ADMIN") {
        throw NotAdmin();
      }
      return user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw UserNotFound();
      } else if (e.code == 'wrong-password') {
        throw WrongPassword();
      } else if (e.code == 'invalid-email') {
        throw InvalidEmail();
      } else {
        rethrow;
      }
    }
  }
}
