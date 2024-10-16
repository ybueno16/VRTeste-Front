import 'package:mobx/mobx.dart';
import 'package:vrteste_front/matricula/domain/infra/matricula_entity.dart';
import 'package:vrteste_front/matricula/domain/infra/matricula_info_entity.dart';
import 'package:vrteste_front/matricula/matricula_presenter.dart';

part 'matricula_store.g.dart';

class MatriculaStore = MatriculaStoreBase with _$MatriculaStore;

abstract class MatriculaStoreBase with Store {
  MatriculaPresenter matriculaPresenter = MatriculaPresenter();

  @observable
  List<MatriculaInfoEntity> matriculas = [];

  @observable
  bool isLoading = false;

  Future<void> getMatriculas() async {
    isLoading = true;
    try {
      final matriculas = await matriculaPresenter.getMatriculas();
      this.matriculas = matriculas;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<void> cadastrarMatricula(MatriculaEntity matricula) async {
    isLoading = true;
    try {
      await matriculaPresenter.cadastrarMatricula(matricula);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<void> deletarMatricula(int id) async {
    isLoading = true;
    try {
      await matriculaPresenter.deletarMatricula(id);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  Future<void> getMatriculasFiltradas({String? pesquisa}) async {
    isLoading = true;
    try {
      final matriculas =
          await matriculaPresenter.getMatriculasFiltradas(pesquisa: pesquisa);
      this.matriculas = matriculas;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
