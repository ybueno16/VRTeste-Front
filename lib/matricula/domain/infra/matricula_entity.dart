class MatriculaEntity {
  final int id;
  final int idAluno;
  final int idCurso;

  MatriculaEntity(
      {required this.id, required this.idAluno, required this.idCurso});

  factory MatriculaEntity.fromJson(Map<String, dynamic> json) {
    return MatriculaEntity(
      id: json['id'] ?? 0,
      idAluno: json['idAluno'],
      idCurso: json['idCurso'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'idAluno': idAluno,
      'idCurso': idCurso,
    };
  }
}
