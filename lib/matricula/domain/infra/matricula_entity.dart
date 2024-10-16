class MatriculaEntity {
  final int id;
  final int idAluno;
  final int idCurso;

  MatriculaEntity({required this.id, required this.idAluno, required this.idCurso});

  factory MatriculaEntity.fromJson(Map<String, dynamic> json) {
    return MatriculaEntity(
      id: json['id'],
      idAluno: json['id_aluno'],
      idCurso: json['id_curso'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'id_aluno': idAluno,
      'id_curso': idCurso,
    };
  }
}