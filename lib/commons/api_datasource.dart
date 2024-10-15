import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:vrteste_front/config/routes.dart';
import 'package:vrteste_front/curso/domain/entities/curso_entity.dart';

class ApiDatasource {
  Dio dio = Dio();
  Routes routes = Routes();
  static Future<String> getBaseUrl() async {
    await dotenv.load(fileName: '.env');

    String? ip = dotenv.env['IP'];
    String? port = dotenv.env['PORT'];
    String? baseApi = dotenv.env['BASE_API'];
    String baseUrl = 'http://$ip:$port/$baseApi';
    return baseUrl;
  }

  Future<List<CursoEntity>> getCursos() async {
    String baseUrl = await getBaseUrl();
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
