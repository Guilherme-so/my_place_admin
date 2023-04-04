import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_place_admin/core/Models/categoria_model.dart';

class FormCategoriaController {
  final CategoriaModel _categoria = CategoriaModel();
  final ImagePicker _imagePicker = ImagePicker();

  final _firebaseStorage = FirebaseStorage.instance.ref();

  final categoriaRef = FirebaseFirestore.instance.collection("categorias");

  Future<void> salvarCategoria() async {
    await categoriaRef.add(_categoria.toJson());
  }

  Future<String?> escolheESalvaImagem(ImageSource source) async {
    final XFile? arquivo = await _imagePicker.pickImage(source: source);

    if (arquivo != null) {
      final image = await arquivo.readAsBytes();
      final dataImage = image.buffer.asUint8List();
      final uploadTask = _firebaseStorage
          .child('categorias')
          .child(dataImage.hashCode.toString())
          .putData(dataImage);

      final onTaskComplete = await uploadTask.whenComplete(() => {});
      final urlDownload = await onTaskComplete.ref.getDownloadURL();
      print(urlDownload);
      return urlDownload;
    }
    return null;
  }

  void setCategoriaNome(String nome) => _categoria.nome = nome;

  void setCategoriaDescricao(String descricao) =>
      _categoria.descricao = descricao;

  void setCategoriaUrlImage(String urlImage) => _categoria.urlImage = urlImage;

  CategoriaModel get categoria => _categoria;
}
