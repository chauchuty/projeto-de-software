class Servico {
  int? id;
  String nome;
  double valor;
  String? descricao;

  Servico({
    this.id,
    required this.nome,
    required this.valor,
    this.descricao,
  });

  void propDynamic(String key, dynamic value) {
    switch (key) {
      case 'id':
        id = value;
        break;
      case 'nome':
        nome = value;
        break;
      case 'valor':
        valor = value;
        break;
      case 'descricao':
        descricao = value;
        break;
      default:
    }
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'nome': nome});
    result.addAll({'valor': valor});
    if (descricao != null) {
      result.addAll({'descricao': descricao});
    }

    return result;
  }

  factory Servico.fromMap(Map<String, dynamic> map) {
    return Servico(
      id: map['id']?.toInt(),
      nome: map['nome'] ?? '',
      valor: map['valor']?.toDouble() ?? 0.0,
      descricao: map['descricao'],
    );
  }
}
