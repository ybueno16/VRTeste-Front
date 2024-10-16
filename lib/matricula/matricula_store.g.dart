// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matricula_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$MatriculaStore on MatriculaStoreBase, Store {
  late final _$matriculasAtom =
      Atom(name: 'MatriculaStoreBase.matriculas', context: context);

  @override
  List<MatriculaInfoEntity> get matriculas {
    _$matriculasAtom.reportRead();
    return super.matriculas;
  }

  @override
  set matriculas(List<MatriculaInfoEntity> value) {
    _$matriculasAtom.reportWrite(value, super.matriculas, () {
      super.matriculas = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'MatriculaStoreBase.isLoading', context: context);

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

  @override
  String toString() {
    return '''
matriculas: ${matriculas},
isLoading: ${isLoading}
    ''';
  }
}
