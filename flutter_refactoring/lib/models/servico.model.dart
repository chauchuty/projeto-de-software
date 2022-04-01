class Servico {
  int? id;
  String nome;
  String? descricao;
  double valor;

  Servico({
    this.id,
    required this.nome,
    this.descricao,
    required this.valor,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'nome': nome});
    if (descricao != null) {
      result.addAll({'descricao': descricao});
    }
    result.addAll({'valor': valor});

    return result;
  }

  factory Servico.fromMap(Map<String, dynamic> map) {
    return Servico(
      id: map['id']?.toInt(),
      nome: map['nome'] ?? '',
      descricao: map['descricao'],
      valor: map['valor']?.toDouble() ?? 0.0,
    );
  }
}
