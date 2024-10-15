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
