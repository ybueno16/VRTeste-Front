import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vrteste_front/commons/widgets/card_commons.dart';
import 'package:vrteste_front/commons/widgets/textfield_commons.dart';
import 'package:vrteste_front/commons/widgets/confirmation_dialog.dart';
import 'package:vrteste_front/commons/widgets/error_toast.dart';
import 'package:vrteste_front/matricula/matricula_store.dart';
import 'package:vrteste_front/matricula/widgets/matricula_modal.dart';

class MatriculaPage extends StatefulWidget {
  const MatriculaPage({super.key});

  @override
  _MatriculaPageState createState() => _MatriculaPageState();
}

class _MatriculaPageState extends State<MatriculaPage> {
  final _matriculaStore = MatriculaStore();
  final _controller = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _matriculaStore.getMatriculas();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Matriculas'),
        ),
        body: Observer(builder: (context) {
          if (_matriculaStore.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return RefreshIndicator(
            onRefresh: () async {
              await _matriculaStore.getMatriculas();
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: PesquisaTextField(
                          dica: "Pesquisar por descrição",
                          controller: _controller,
                          onChanged: (pesquisa) {
                            if (_debounce?.isActive ?? false) {
                              _debounce!.cancel();
                            }
                            _debounce =
                                Timer(const Duration(milliseconds: 500), () {
                              _matriculaStore
                                  .getMatriculasFiltradas(
                                      pesquisa: _controller.text)
                                  .catchError((e) {
                                ErrorToast.show(context);
                              });
                            });
                          },
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return Dialog(
                                child: MatriculaModal(
                                  onSalvar: (matricula) {
                                    _matriculaStore
                                        .cadastrarMatricula(matricula)
                                        .then((_) {
                                      _matriculaStore.getMatriculas();
                                      Navigator.of(context).pop();
                                    }).catchError((e) {
                                      print('Erro ao cadastrar curso: $e');
                                      ErrorToast.show(context);
                                    });
                                  },
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.add),
                      ),
                    ],
                  ),
                ),
                Observer(
                  builder: (context) {
                    if (_matriculaStore.isLoading) {
                      _matriculaStore.getMatriculas();
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: _matriculaStore.matriculas.length,
                          itemBuilder: (context, index) {
                            final matricula = _matriculaStore.matriculas[index];

                            return InkWell(
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ConfirmDialog(
                                      title: 'Excluir Curso',
                                      message:
                                          'Você tem certeza que deseja excluir a matricula?',
                                      onPressedConfirm: () {
                                        _matriculaStore
                                            .deletarMatricula(matricula.id)
                                            .then((_) {
                                          _matriculaStore.getMatriculas();
                                          Navigator.of(context).pop();
                                        }).catchError((e) {
                                          ErrorToast.show(context);
                                        });
                                      },
                                      onPressedCancel: () {
                                        Navigator.of(context).pop();
                                      },
                                    );
                                  },
                                );
                              },
                              child: CardCommons(
                                height: 200,
                                width: 200,
                                children: [
                                  Text("id: ${matricula.id}"),
                                  Text("descrição: ${matricula.nomeAluno}"),
                                  Text("ementa: ${matricula.nomeCurso}"),
                                ],
                              ),
                            );
                          },
                        ),
                      );
                    }
                  },
                ),
              ],
            ),
          );
        }));
  }
}
