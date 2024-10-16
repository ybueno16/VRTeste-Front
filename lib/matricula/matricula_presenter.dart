import 'package:vrteste_front/matricula/data/infra/api_datasource.dart';
import 'package:vrteste_front/matricula/domain/infra/matricula_entity.dart';
import 'package:vrteste_front/matricula/domain/infra/matricula_info_entity.dart';

class MatriculaPresenter {
  ApiDataSourceMatricula apiDatasource = ApiDataSourceMatricula();
  Future<List<MatriculaInfoEntity>> getMatriculas() async {
    return apiDatasource.getMatriculas();
  }

  Future<Future<MatriculaEntity>> cadastrarMatricula(
      MatriculaEntity matricula) async {
    return apiDatasource.cadastrarMatricula(matricula);
  }

  Future<MatriculaEntity> deletarMatricula(int id) async {
    return apiDatasource.deletarMatricula(id);
  }

  Future<List<MatriculaInfoEntity>> getMatriculasFiltradas(
      {String? pesquisa}) async {
    final matriculas = await getMatriculas();
    return matriculas.where((matricula) {
      return matricula.nomeAluno
              .toString()
              .toLowerCase()
              .contains(pesquisa!.toLowerCase()) ||
          matricula.nomeCurso
              .toString()
              .toLowerCase()
              .contains(pesquisa.toLowerCase());
    }).toList();
  }
}
