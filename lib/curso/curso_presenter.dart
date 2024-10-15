import 'package:vrteste_front/commons/api_datasource.dart';
import 'package:vrteste_front/curso/domain/entities/curso_entity.dart';

class CursoPresenter {

  Future<List<CursoEntity>> getCursos() async {
    ApiDatasource apiDatasource = ApiDatasource();
    return await apiDatasource.getCursos();
  }
}