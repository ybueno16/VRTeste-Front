class MatriculaInfoEntity {
  final int id;
  final String nomeAluno;
  final String nomeCurso;

  MatriculaInfoEntity({required this.id, required this.nomeAluno, required this.nomeCurso});

  factory MatriculaInfoEntity.fromJson(Map<String, dynamic> json) {
    return MatriculaInfoEntity(
      id: json['id'],
      nomeAluno: json['nomeAluno'],
      nomeCurso: json['nomeCurso'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nomeAluno': nomeAluno,
      'nomeCurso': nomeCurso,
    };
  }
}