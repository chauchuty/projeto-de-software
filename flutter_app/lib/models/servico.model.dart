class Servico {
  int id;
  String nome;
  String descricao;
  double preco;

  Servico({
    required this.id,
    required this.nome,
    required this.descricao,
    required this.preco,
  });

  factory Servico.fromJson(Map<String, dynamic> json) {
    return Servico(
      id: json['id'] as int,
      nome: json['nome'] as String,
      descricao: json['descricao'] as String,
      preco: json['preco'] as double,
    );
  }
}
