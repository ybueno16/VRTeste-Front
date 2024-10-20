// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'aluno_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AlunoStore on AlunoStoreBase, Store {
  late final _$alunosAtom =
      Atom(name: 'AlunoStoreBase.alunos', context: context);

  @override
  List<AlunoEntity> get alunos {
    _$alunosAtom.reportRead();
    return super.alunos;
  }

  @override
  set alunos(List<AlunoEntity> value) {
    _$alunosAtom.reportWrite(value, super.alunos, () {
      super.alunos = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'AlunoStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getAlunosAsyncAction =
      AsyncAction('AlunoStoreBase.getAlunos', context: context);

  @override
  Future<void> getAlunos() {
    return _$getAlunosAsyncAction.run(() => super.getAlunos());
  }

  late final _$removerAlunoAsyncAction =
      AsyncAction('AlunoStoreBase.removerAluno', context: context);

  @override
  Future<void> removerAluno(int id) {
    return _$removerAlunoAsyncAction.run(() => super.removerAluno(id));
  }

  late final _$alterarAlunoAsyncAction =
      AsyncAction('AlunoStoreBase.alterarAluno', context: context);

  @override
  Future<AlunoEntity> alterarAluno(AlunoEntity aluno) {
    return _$alterarAlunoAsyncAction.run(() => super.alterarAluno(aluno));
  }

  late final _$cadastrarAlunoAsyncAction =
      AsyncAction('AlunoStoreBase.cadastrarAluno', context: context);

  @override
  Future<AlunoEntity> cadastrarAluno(AlunoEntity aluno) {
    return _$cadastrarAlunoAsyncAction.run(() => super.cadastrarAluno(aluno));
  }

  late final _$getAlunosFiltradosAsyncAction =
      AsyncAction('AlunoStoreBase.getAlunosFiltrados', context: context);

  @override
  Future<void> getAlunosFiltrados({String? pesquisa}) {
    return _$getAlunosFiltradosAsyncAction
        .run(() => super.getAlunosFiltrados(pesquisa: pesquisa));
  }

  @override
  String toString() {
    return '''
alunos: ${alunos},
isLoading: ${isLoading}
    ''';
  }
}
