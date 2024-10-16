class AlunoEntity {
  final int? id;
  final String nome;

  AlunoEntity({
    required this.id,
    required this.nome,
  });

  factory AlunoEntity.fromJson(Map<String, dynamic> json) {
    return AlunoEntity(
      id: json['id'] ?? 0,
      nome: json['nome'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
    };
  }
}
