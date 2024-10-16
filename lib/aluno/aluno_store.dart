import 'package:mobx/mobx.dart';
import 'package:vrteste_front/aluno/aluno_presenter.dart';
import 'package:vrteste_front/aluno/domain/entities/aluno_entity.dart';

part 'aluno_store.g.dart';

class AlunoStore = AlunoStoreBase with _$AlunoStore;

abstract class AlunoStoreBase with Store {
  AlunoPresenter alunoPresenter = AlunoPresenter();

  @observable
  List<AlunoEntity> alunos = [];

  @observable
  bool isLoading = false;

  @action
  Future<void> getAlunos() async {
    isLoading = true;
    try {
      final alunos = await alunoPresenter.getAlunos();
      this.alunos = alunos;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> removerAluno(int id) async {
    isLoading = true;
    try {
      await alunoPresenter.removerAluno(id);
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<AlunoEntity> alterarAluno(AlunoEntity aluno) async {
    isLoading = true;
    try {
      final alterarAluno = await alunoPresenter.alterarAluno(aluno);
      return alterarAluno;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<AlunoEntity> cadastrarAluno(AlunoEntity aluno) async {
    isLoading = true;
    try {
      final cadastroAluno = await alunoPresenter.cadastrarAluno(aluno);
      return cadastroAluno;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> getAlunosFiltrados({String? pesquisa}) async {
    isLoading = true;
    try {
      final alunos =
          await alunoPresenter.getAlunosFiltrados(pesquisa: pesquisa);
      this.alunos = alunos;
    } catch (e) {
      rethrow;
    } finally {
      isLoading = false;
    }
  }
}
