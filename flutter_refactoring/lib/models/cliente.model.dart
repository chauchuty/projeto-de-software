class Cliente {
  int? id;
  String nome;
  String? telefone;
  String? email;

  Cliente({
    this.id,
    required this.nome,
    this.telefone,
    this.email,
  });

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    if (id != null) {
      result.addAll({'id': id});
    }
    result.addAll({'nome': nome});
    if (telefone != null) {
      result.addAll({'telefone': telefone});
    }
    if (email != null) {
      result.addAll({'email': email});
    }

    return result;
  }

  factory Cliente.fromMap(Map<String, dynamic> map) {
    return Cliente(
      id: map['id']?.toInt(),
      nome: map['nome'] ?? '',
      telefone: map['telefone'],
      email: map['email'],
    );
  }
}
