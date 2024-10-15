import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vrteste_front/commons/widgets/card_commons.dart';
import 'package:vrteste_front/commons/widgets/textfield_commons.dart';
import 'package:vrteste_front/curso/curso_store.dart';
import 'package:vrteste_front/curso/widget/curso_modal.dart';
import 'package:vrteste_front/commons/widgets/confirmation_dialog.dart';

class CursoPage extends StatefulWidget {
  const CursoPage({super.key});

  @override
  _CursoPageState createState() => _CursoPageState();
}

class _CursoPageState extends State<CursoPage> {
  final _cursoStore = CursoStore();
  final _controller = TextEditingController();
  Timer? _debounce;

  @override
  void initState() {
    super.initState();
    _cursoStore.getCursos();
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
        title: const Text('Cursos'),
      ),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Observer(
      builder: (context) {
        if (_cursoStore.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        return RefreshIndicator(
          onRefresh: _cursoStore.getCursos,
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
                          if (_debounce?.isActive ?? false) _debounce!.cancel();
                          _debounce =
                              Timer(const Duration(milliseconds: 500), () {
                            _cursoStore.getCursosFiltrados(
                                descricao: _controller.text);
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
                              child: CursoModal(
                                onSalvar: (curso) {
                                  _cursoStore.cadastrarCursos(curso).then((_) {
                                    setState(() {});
                                    _cursoStore.getCursos();
                                    Navigator.of(context).pop();
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
                  if (_cursoStore.isLoading) {
                    _cursoStore.getCursos();
                    return const Center(child: CircularProgressIndicator());
                  } else if (_cursoStore.cursos != null) {
                    return Expanded(
                      child: ListView.builder(
                        itemCount: _cursoStore.cursos?.length,
                        itemBuilder: (context, index) {
                          final curso = _cursoStore.cursos![index];

                          return InkWell(
                            onLongPress: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return ConfirmDialog(
                                    title: 'Excluir Curso',
                                    message:
                                        'Você tem certeza que deseja excluir o curso ${curso.descricao}?',
                                    onPressedConfirm: () {
                                      _cursoStore.removerCurso(curso.id!);
                                      Navigator.of(context).pop();
                                      _cursoStore.getCursos();
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
                                Text("id: ${curso.id}"),
                                Text("descrição: ${curso.descricao}"),
                                Text("ementa: ${curso.ementa}"),
                              ],
                            ),
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                    child: CursoModal(
                                      onSalvar: (cursoEditado) {
                                        _cursoStore
                                            .alterarCursos(cursoEditado)
                                            .then((_) {
                                          setState(() {});
                                          _cursoStore.getCursos();
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      curso: curso,
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        },
                      ),
                    );
                  } else {
                    return const Center(child: Text("Nenhum curso encontrado"));
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
