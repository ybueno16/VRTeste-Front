import 'package:vrteste_front/curso/data/infra/api_datasource.dart';
import 'package:vrteste_front/curso/domain/entities/curso_entity.dart';

class CursoPresenter {

  Future<List<CursoEntity>> getCursos() async {
    ApiDatasourceCurso apiDatasource = ApiDatasourceCurso();
    return await apiDatasource.getCursos();
  }

  Future<List<CursoEntity>> getCursosFiltrados({int? id, String? descricao}) async {
    final cursos = await getCursos();
    return cursos.where((curso) {
      if (id != null && curso.id != id) return false;
      if (descricao != null && !curso.descricao.contains(descricao)) return false;
      return true;
    }).toList();
  }
}