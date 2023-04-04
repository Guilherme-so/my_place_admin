class CategoriaModel {
  CategoriaModel({
    this.id,
    this.nome,
    this.descricao,
    this.urlImage,
  });

  String? id;
  String? nome;
  String? descricao;
  String? urlImage;

  CategoriaModel.fromJson(String userId, Map<String, dynamic> json) {
    id = userId;
    nome = json['nome'];
    descricao = json['descricao'];
    urlImage = json['urlImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['nome'] = nome;
    data['descricao'] = descricao;
    data['urlImage'] = urlImage;
    return data;
  }
}
