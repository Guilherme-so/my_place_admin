import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:my_place_admin/core/Models/categoria_model.dart';

class FormCategoriaController {
  CategoriaModel _categoria = CategoriaModel();

  void setCategoriaNome(String nome) => _categoria.nome = nome;
  void setCategoriaDescricao(String descricao) =>
      _categoria.descricao = descricao;

  final categoriaRef = FirebaseFirestore.instance.collection("categorias");

  Future<void> salvarCategoria() async {
    await categoriaRef.add(_categoria.toJson());
  }
}
