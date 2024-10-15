// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'curso_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CursoStore on CursoStoreBase, Store {
  late final _$cursosAtom =
      Atom(name: 'CursoStoreBase.cursos', context: context);

  @override
  List<CursoEntity>? get cursos {
    _$cursosAtom.reportRead();
    return super.cursos;
  }

  @override
  set cursos(List<CursoEntity>? value) {
    _$cursosAtom.reportWrite(value, super.cursos, () {
      super.cursos = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'CursoStoreBase.isLoading', context: context);

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

  late final _$getCursosAsyncAction =
      AsyncAction('CursoStoreBase.getCursos', context: context);

  @override
  Future<void> getCursos() {
    return _$getCursosAsyncAction.run(() => super.getCursos());
  }

  late final _$getCursosFiltradosAsyncAction =
      AsyncAction('CursoStoreBase.getCursosFiltrados', context: context);

  @override
  Future<void> getCursosFiltrados({int? id, String? descricao}) {
    return _$getCursosFiltradosAsyncAction
        .run(() => super.getCursosFiltrados(id: id, descricao: descricao));
  }

  @override
  String toString() {
    return '''
cursos: ${cursos},
isLoading: ${isLoading}
    ''';
  }
}
