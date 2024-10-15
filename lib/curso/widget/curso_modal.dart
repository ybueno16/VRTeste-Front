import 'package:flutter/material.dart';
import 'package:vrteste_front/curso/domain/entities/curso_entity.dart';

class CursoModal extends StatefulWidget {
  final CursoEntity? curso;
  final Function(CursoEntity) onSalvar;

  const CursoModal({Key? key, this.curso, required this.onSalvar})
      : super(key: key);

  @override
  _CursoModalState createState() => _CursoModalState();
}

class _CursoModalState extends State<CursoModal> {
  final _descricaoController = TextEditingController();
  final _ementaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.curso != null) {
      _descricaoController.text = widget.curso!.descricao;
      _ementaController.text = widget.curso!.ementa;
    }
  }

void _salvar() {
  final curso = CursoEntity(
    id: widget.curso?.id,
    descricao: _descricaoController.text,
    ementa: _ementaController.text,
  );
  try {
    widget.onSalvar(curso).then((_) {
      Navigator.of(context).pop();
    });
  } catch (e) {
    throw Exception('Erro ao salvar o curso');
  }
}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _descricaoController,
            decoration: const InputDecoration(
              labelText: 'Descrição',
            ),
          ),
          TextField(
            controller: _ementaController,
            decoration: const InputDecoration(
              labelText: 'Ementa',
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _salvar,
            child: const Text('Salvar'),
          ),
        ],
      ),
    );
  }
}