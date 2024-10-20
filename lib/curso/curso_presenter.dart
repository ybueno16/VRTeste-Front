import 'package:vrteste_front/curso/data/infra/api_datasource.dart';
import 'package:vrteste_front/curso/domain/entities/curso_entity.dart';

class CursoPresenter {
  ApiDatasourceCurso apiDatasource = ApiDatasourceCurso();

  Future<List<CursoEntity>> getCursos() async {
    return await apiDatasource.getCursos();
  }

  Future<CursoEntity> cadastrarCurso(CursoEntity curso) async {
    return await apiDatasource.cadastrarCurso(curso);
  }

  Future<int> removerCurso(int id) async {
    return await apiDatasource.removerCurso(id);
  }

  Future<CursoEntity> alterarCurso(CursoEntity curso) async {
    return await apiDatasource.alterarCurso(curso);
  }

  Future<List<CursoEntity>> getCursosFiltrados({String? pesquisa}) async {
    final cursos = await getCursos();
    return cursos.where((curso) {
      return curso.id
              .toString()
              .toLowerCase()
              .contains(pesquisa?.toLowerCase() ?? '') ||
          curso.descricao
              .toLowerCase()
              .contains(pesquisa?.toLowerCase() ?? '') ||
          curso.ementa.toLowerCase().contains(pesquisa?.toLowerCase() ?? '');
    }).toList();
  }
}
