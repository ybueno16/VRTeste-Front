import 'package:flutter/material.dart';
import 'package:vrteste_front/matricula/domain/infra/matricula_entity.dart';

class MatriculaModal extends StatefulWidget {
  final MatriculaEntity? matricula;
  final Function(MatriculaEntity) onSalvar;

  const MatriculaModal({Key? key, required this.onSalvar, this.matricula})
      : super(key: key);

  @override
  _MatriculaModalState createState() => _MatriculaModalState();
}

class _MatriculaModalState extends State<MatriculaModal> {
  final _idAlunoController = TextEditingController();
  final _idCursoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.matricula != null) {
      _idAlunoController.text = widget.matricula!.idAluno as String;
      _idCursoController.text = widget.matricula!.idCurso as String;
    }
  }

  void _salvar() {
    final matricula = MatriculaEntity(
      id: widget.matricula?.id ?? 0,
      idAluno: int.parse(_idAlunoController.text),
      idCurso: int.parse(_idCursoController.text),
    );
    widget.onSalvar(matricula).then((_) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _idAlunoController,
            decoration: const InputDecoration(
              labelText: 'ID Aluno',
            ),
          ),
          TextField(
            controller: _idCursoController,
            decoration: const InputDecoration(
              labelText: 'ID Curso',
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
