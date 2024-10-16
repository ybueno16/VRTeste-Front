import 'package:flutter/material.dart';
import 'package:vrteste_front/aluno/domain/entities/aluno_entity.dart';
import 'package:vrteste_front/commons/widgets/error_toast.dart';

class AlunoModal extends StatefulWidget {
  final AlunoEntity? aluno;
  final Function(AlunoEntity) onSalvar;

  const AlunoModal({Key? key, this.aluno, required this.onSalvar})
      : super(key: key);

  @override
  _AlunoModalState createState() => _AlunoModalState();
}

class _AlunoModalState extends State<AlunoModal> {
  final _alunoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.aluno != null) {
      _alunoController.text = widget.aluno!.nome;
    }
  }

  void _salvar() {
    if (_alunoController.text.isEmpty) {
      ErrorToast.show(context);
      return;
    }

    final aluno = AlunoEntity(
      id: widget.aluno?.id ?? 0,
      nome: _alunoController.text,
    );
    try {
      widget.onSalvar(aluno).then((_) {
        Navigator.of(context).pop();
      });
    } catch (e) {
      throw Exception('Erro ao salvar o aluno');
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
            controller: _alunoController,
            decoration: const InputDecoration(
              labelText: 'Descrição',
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
