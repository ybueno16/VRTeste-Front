import 'package:vrteste_front/aluno/domain/entities/aluno_entity.dart';
import 'package:vrteste_front/aluno/data/infra/api_datasource.dart';

class AlunoPresenter {
  ApiDatasourceAluno apiDatasource = ApiDatasourceAluno();

  Future<List<AlunoEntity>> getAlunos() async {
    return apiDatasource.getCursos();
  }

  Future<AlunoEntity> cadastrarAluno(AlunoEntity aluno) async {
    return apiDatasource.cadastrarAluno(aluno);
  }

  Future<AlunoEntity> alterarAluno(AlunoEntity aluno) async {
    return apiDatasource.alterarAluno(aluno);
  }

  Future<int> removerAluno(int id) async {
    return apiDatasource.removerAluno(id);
  }

  Future<List<AlunoEntity>> getAlunosFiltrados({String? pesquisa}) async {
    final alunos = await getAlunos();
    return alunos.where((aluno) {
      return aluno.nome.toLowerCase().contains(pesquisa!.toLowerCase()) ||
          aluno.id.toString().toLowerCase().contains(pesquisa.toLowerCase());
    }).toList();
  }
}
