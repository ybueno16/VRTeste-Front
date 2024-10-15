import 'package:dio/dio.dart';
import 'package:vrteste_front/commons/api_datasource.dart';
import 'package:vrteste_front/config/routes.dart';
import 'package:vrteste_front/curso/domain/entities/curso_entity.dart';

class ApiDatasourceCurso {
Dio dio = Dio();

  Future<List<CursoEntity>> getCursos() async {
    String baseUrl = await ApiDatasource.getBaseUrl();
    try {
      Response response = await dio.get('$baseUrl${Routes.cursos}');

      if (response.statusCode == 200) {
        List<CursoEntity> cursos = (response.data['data'] as List)
            .map<CursoEntity>((curso) => CursoEntity.fromJson(curso))
            .toList();
        return cursos;
      } else {
        throw Exception("Erro ao obter cursos");
      }
    } catch (e) {
      rethrow;
    }
  }
}