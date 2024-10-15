import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:vrteste_front/commons/card_commons.dart';
import 'package:vrteste_front/commons/widgets/textfield_commons.dart';
import 'package:vrteste_front/curso/curso_store.dart';

class CursoPage extends StatefulWidget {
  const CursoPage({super.key});

  @override
  State<CursoPage> createState() => _CursoPageState();
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
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Cursos')),
      body: SizedBox(
        height: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: PesquisaTextField(
                      dica: "Pesquisar por descrição",
                      icon: const Icon(Icons.search),
                      controller: _controller,
                      onChanged: (pesquisa) {
                        if (_debounce?.isActive ?? false) _debounce!.cancel();
                        _debounce = Timer(const Duration(milliseconds: 500), () {
                          _cursoStore.getCursosFiltrados(
                              descricao: _controller.text);
                        });
                      },
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      _cursoStore.getCursos();
                    },
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
            Observer(
              builder: (context) {
                if (_cursoStore.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (_cursoStore.cursos != null) {
                  return Expanded(
                    child: ListView.builder(
                      itemCount: _cursoStore.cursos?.length,
                      itemBuilder: (context, index) {
                        return CardCommons(
                          height: 200,
                          width: 200,
                          children: [
                            Text("id: ${_cursoStore.cursos![index].id}"),
                            Text(
                                "descrição: ${_cursoStore.cursos![index].descricao}"),
                            Text(
                                "ementa: ${_cursoStore.cursos![index].ementa}"),
                          ],
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
      ),
    );
  }
}
