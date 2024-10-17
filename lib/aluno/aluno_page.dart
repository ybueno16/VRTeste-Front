import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vrteste_front/aluno/aluno_store.dart';
import 'package:vrteste_front/aluno/widget/aluno_modal.dart';
import 'package:vrteste_front/commons/widgets/card_commons.dart';
import 'package:vrteste_front/commons/widgets/confirmation_dialog.dart';
import 'package:vrteste_front/commons/widgets/error_toast.dart';
import 'package:vrteste_front/commons/widgets/textfield_commons.dart';

class AlunoPage extends StatefulWidget {
  const AlunoPage({super.key});

  @override
  State<AlunoPage> createState() => _AlunoPageState();
}

class _AlunoPageState extends State<AlunoPage> {
  final AlunoStore _alunoStore = AlunoStore();
  final _controller = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _alunoStore.getAlunos();
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
          title: const Text('Alunos'),
        ),
        body: Observer(builder: (context) {
          if (_alunoStore.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return RefreshIndicator(
            onRefresh: _alunoStore.getAlunos,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: PesquisaTextField(
                          dica: "Pesquisar por nome",
                          controller: _controller,
                          onChanged: (pesquisa) {
                            if (_debounce?.isActive ?? false) {
                              _debounce!.cancel();
                            }
                            _debounce =
                                Timer(const Duration(milliseconds: 500), () {
                              _alunoStore
                                  .getAlunosFiltrados(
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
                                child: AlunoModal(
                                  onSalvar: (aluno) {
                                    _alunoStore.cadastrarAluno(aluno).then((_) {
                                      setState(() {});
                                      _alunoStore.getAlunos();
                                    });
                                  },
                                ),
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.add),
                      )
                    ],
                  ),
                ),
                Observer(
                  builder: (context) {
                    if (_alunoStore.isLoading) {
                      _alunoStore.getAlunos();
                      return const Center(child: CircularProgressIndicator());
                    } else {
                      return Expanded(
                        child: ListView.builder(
                          itemCount: _alunoStore.alunos.length,
                          itemBuilder: (context, index) {
                            final aluno = _alunoStore.alunos[index];

                            return InkWell(
                              onLongPress: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return ConfirmDialog(
                                      title: 'Excluir Aluno',
                                      message:
                                          'Você tem certeza que deseja excluir o aluno ${aluno.nome}?',
                                      onPressedConfirm: () {
                                        _alunoStore
                                            .removerAluno(aluno.id!)
                                            .then((_) {
                                          setState(() {});
                                          _alunoStore.getAlunos();
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
                                height: 100,
                                width: 200,
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text("id: ${aluno.id}"),
                                      Text("nome do aluno: ${aluno.nome}"),
                                    ],
                                  ),
                                ],
                              ),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return Dialog(
                                      child: AlunoModal(
                                        onSalvar: (alunoEditado) {
                                          _alunoStore
                                              .alterarAluno(alunoEditado)
                                              .then((_) {
                                            setState(() {});
                                            _alunoStore.getAlunos();
                                            Navigator.of(context).pop();
                                          }).catchError((e) {
                                            ErrorToast.show(context);
                                          });
                                        },
                                        aluno: aluno,
                                      ),
                                    );
                                  },
                                );
                              },
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
