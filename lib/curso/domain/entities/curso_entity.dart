class CursoEntity {
  final int id;
  final String descricao;
  final String ementa;

  CursoEntity({required this.id, required this.descricao, required this.ementa});

    factory CursoEntity.fromJson(Map<String, dynamic> json) {
    return CursoEntity(
      id: json['id'] as int,
      descricao: json['descricao'] as String,
      ementa: json['ementa'] as String,
    );
  }
}
