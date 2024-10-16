import 'package:dio/dio.dart';
import 'package:vrteste_front/aluno/domain/entities/aluno_entity.dart';
import 'package:vrteste_front/commons/api_datasource.dart';
import 'package:vrteste_front/config/routes.dart';

class ApiDatasourceAluno {
  Dio dio = Dio();

  Future<List<AlunoEntity>> getCursos() async {
    try {
      String baseUrl = await ApiDatasource.getBaseUrl();
      Response response = await dio.get('$baseUrl${Routes.alunos}');
      if (response.statusCode == 200) {
        List<AlunoEntity> alunos = (response.data['data'] as List)
            .map<AlunoEntity>((aluno) => AlunoEntity.fromJson(aluno))
            .toList();
        return alunos;
      } else {
        throw Exception("Erro ao obter alunos");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<AlunoEntity> cadastrarAluno(AlunoEntity aluno) async {
    String baseUrl = await ApiDatasource.getBaseUrl();

    try {
      Response response =
          await dio.post('$baseUrl${Routes.cursos}', data: aluno.toJson());
      if (response.statusCode == 200) {
        final data = response.data['data'];
        if (data != null) {
          final id = data['id'] ?? 0;
          if (data['nome'] != null) {
            return AlunoEntity.fromJson({
              'id': id,
              'nome': data['nome'],
            });
          } else {
            throw Exception("Nome do aluno não foi fornecido");
          }
        } else {
          throw Exception("Invalid JSON response");
        }
      } else {
        throw Exception("Erro ao cadastrar o curso");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<AlunoEntity> alterarAluno(AlunoEntity aluno) async {
    String baseUrl = await ApiDatasource.getBaseUrl();
    try {
      Response response =
          await dio.put('$baseUrl${Routes.alunos}', data: aluno.toJson());
      if (response.statusCode == 200) {
        return AlunoEntity.fromJson(response.data['data']);
      } else {
        throw Exception("Erro ao alterar o aluno");
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<int> removerAluno(int id) async {
    String baseUrl = await ApiDatasource.getBaseUrl();
    try {
      Response response = await dio.delete('$baseUrl${Routes.alunos}/$id');
      if (response.statusCode == 200) {
        return response.statusCode!;
      } else {
        throw Exception("Erro ao remover o aluno");
      }
    } catch (e) {
      rethrow;
    }
  }
}
