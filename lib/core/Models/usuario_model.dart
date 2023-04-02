class UsuarioModel {
  UsuarioModel({
    this.id,
    this.nome,
    this.email,
    this.tipo,
  });

  String? id;
  String? nome;
  String? email;
  String? tipo;

  UsuarioModel.fromJson(String userId, Map<String, dynamic> json) {
    id = userId;
    nome = json['nome'];
    email = json['email'];
    tipo = json['tipo'];
  }
}
