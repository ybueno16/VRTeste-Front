import 'package:mobx/mobx.dart';
import 'package:vrteste_front/curso/curso_presenter.dart';
import 'package:vrteste_front/curso/domain/entities/curso_entity.dart';

part 'curso_store.g.dart';

class CursoStore = CursoStoreBase with _$CursoStore;

abstract class CursoStoreBase with Store {
  CursoPresenter cursoPresenter = CursoPresenter();

  @observable
  List<CursoEntity>? cursos;

  @observable
  bool isLoading = false;

  @action
  Future<void> getCursos() async {
    isLoading = true;
    try {
      final cursos = await cursoPresenter.getCursos();
      this.cursos = cursos;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<CursoEntity> cadastrarCursos(CursoEntity curso) async {
    isLoading = true;
    try {
      final cadastroCurso = await cursoPresenter.cadastrarCurso(curso);
      return cadastroCurso;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<CursoEntity> alterarCursos(CursoEntity curso) async {
    isLoading = true;
    try {
      final alterarCurso = await cursoPresenter.alterarCurso(curso);
      return alterarCurso;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> removerCurso(int id) async {
    isLoading = true;
    try {
      await cursoPresenter.removerCurso(id);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> getCursosFiltrados({int? id, String? descricao}) async {
    isLoading = true;
    try {
      final cursos =
          await cursoPresenter.getCursosFiltrados(id: id, descricao: descricao);
      this.cursos = cursos;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
