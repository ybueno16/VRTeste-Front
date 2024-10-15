import 'package:dio/dio.dart';
import 'package:vrteste_front/commons/api_datasource.dart';
import 'package:vrteste_front/config/routes.dart';
import 'package:vrteste_front/curso/domain/entities/curso_entity.dart';

class ApiDatasourceCurso {
Dio dio = Dio();

  Future<List<CursoEntity>> getCursos() async {
    try {
    String baseUrl =  await ApiDatasource.getBaseUrl();
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

  Future<CursoEntity> cadastrarCurso(CursoEntity curso) async {
    String baseUrl = await ApiDatasource.getBaseUrl();

    try {
      Response response = await dio.post('$baseUrl${Routes.cursos}',
          data: curso.toJson());
      if (response.statusCode == 201) {
        return CursoEntity.fromJson(response.data['data']);
      } else {
        throw Exception("Erro ao cadastrar o curso");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<CursoEntity> alterarCurso(CursoEntity curso) async {
    String baseUrl = await ApiDatasource.getBaseUrl();
    try {
      Response response = await dio.put('$baseUrl${Routes.cursos}',
          data: curso.toJson());
      if (response.statusCode == 200) {
        return CursoEntity.fromJson(response.data['data']);
      } else {
        throw Exception("Erro ao alterar o curso");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<int> removerCurso(int id) async {
    String baseUrl = await ApiDatasource.getBaseUrl();
    try {
      Response response = await dio.delete('$baseUrl${Routes.cursos}/$id');
      if (response.statusCode == 200) {
        return response.statusCode!;
      } else {
        throw Exception("Erro ao remover o curso");
      }
    } catch (e) {
      rethrow;
    }
  }
}