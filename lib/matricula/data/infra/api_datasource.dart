import 'package:dio/dio.dart';
import 'package:vrteste_front/commons/api_datasource.dart';
import 'package:vrteste_front/config/routes.dart';
import 'package:vrteste_front/matricula/domain/infra/matricula_entity.dart';
import 'package:vrteste_front/matricula/domain/infra/matricula_info_entity.dart';

class ApiDataSourceMatricula {
  Dio dio = Dio();

  Future<List<MatriculaInfoEntity>> getMatriculas() async {
    try {
      String baseUrl = await ApiDatasource.getBaseUrl();
      Response response = await dio.get('$baseUrl${Routes.matriculas}');
      if (response.statusCode == 200) {
        List<MatriculaInfoEntity> matriculas = (response.data['data'] as List)
            .map<MatriculaInfoEntity>(
                (matricula) => MatriculaInfoEntity.fromJson(matricula))
            .toList();
        return matriculas;
      } else {
        throw Exception("Erro ao obter alunos");
      }
    } on DioException catch (e) {
      if (e.response != null) {
        if (e.response!.statusCode == 500) {
          // Handle server error
          throw Exception("Erro interno do servidor");
        } else {
          throw Exception("Erro ao obter alunos");
        }
      } else {
        throw Exception("Erro ao conectar ao servidor");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<MatriculaEntity> cadastrarMatricula(MatriculaEntity matricula) async {
    String baseUrl = await ApiDatasource.getBaseUrl();
    try {
      Response response = await dio.post('$baseUrl${Routes.matriculas}',
          data: matricula.toJson());
      if (response.statusCode == 200) {
        print(response.data['data']);
        return MatriculaEntity.fromJson(response.data['data']);
      } else {
        throw Exception("Erro ao cadastrar a matricula");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<MatriculaEntity> deletarMatricula(int id) async {
    String baseUrl = await ApiDatasource.getBaseUrl();
    try {
      Response response = await dio.delete('$baseUrl${Routes.matriculas}/$id');
      if (response.statusCode == 200) {
        return MatriculaEntity.fromJson(response.data['data']);
      } else {
        throw Exception("Erro ao deletar a matricula");
      }
    } catch (e) {
      rethrow;
    }
  }
}
