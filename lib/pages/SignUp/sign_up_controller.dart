import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

class SignUpController {
  String _nome = '';
  String _email = '';
  String _senha = '';
  String _confirmaSenha = '';

  bool _verSenha = true;
  bool _verComfirmaSenha = true;

  String _error = '';
  bool _isLoading = false;

  final _firebaseAuth = FirebaseAuth.instance;
  final _userRef = FirebaseFirestore.instance.collection('usuarios');

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
    final credentials = await _firebaseAuth.createUserWithEmailAndPassword(
        email: _email, password: _senha);

    await _userRef.doc(credentials.user?.uid).set(
      {
        'nome': _nome,
        'email': _email,
        'tipo': "ADMIN",
      },
    );
  }

  void setNome(String nome) => _nome = nome;
  void setEmail(String email) => _email = email;
  void setSenha(String senha) => _senha = senha;
  void setComfirmarSenha(String comfirmarSenha) =>
      _confirmaSenha = comfirmarSenha;
  void setIsLoading(bool loading) => _isLoading = loading;
  void setError(String error) => _error = error;

  void setToogleVersenha() => _verSenha = !_verSenha;
  void setToogleComfirmarSenha() => _verComfirmaSenha = !_verComfirmaSenha;

  bool get isLoading => _isLoading;
  String get error => _error;
  bool get verSenha => _verSenha;
  bool get verComfirmaSenha => _verComfirmaSenha;
}
