import 'package:cloud_firestore/cloud_firestore.dart';

import '../../core/Models/categoria_model.dart';

class ListaController {
  CollectionReference categoriaRef =
      FirebaseFirestore.instance.collection('categorias');

  final Stream<QuerySnapshot> _categoriasStream =
      FirebaseFirestore.instance.collection('categorias').snapshots();

  Stream<QuerySnapshot> categoriaStream() => _categoriasStream;

  List<CategoriaModel> getCategoriasFromDocs(List<QueryDocumentSnapshot> docs) {
    return List.generate(docs.length, (index) {
      final categoriaDoc = docs[index];
      return CategoriaModel.fromJson(
        categoriaDoc.id,
        categoriaDoc.data() as Map<String, dynamic>,
      );
    });
  }
}
