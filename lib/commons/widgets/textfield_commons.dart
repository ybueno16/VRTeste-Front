import 'package:flutter/material.dart';

class PesquisaTextField extends StatefulWidget {
  final String dica;
  final Icon icon;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  const PesquisaTextField({
    super.key,
    required this.dica,
    required this.icon,
    required this.controller,
    required this.onChanged,
  });

  @override
  State<PesquisaTextField> createState() => _PesquisaTextFieldState();
}

class _PesquisaTextFieldState extends State<PesquisaTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Descrição da pesquisa:',
          style: TextStyle(fontSize: 16, color: Colors.grey[600]),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: widget.controller,
          onChanged: (pesquisa) {
                widget.onChanged?.call(pesquisa);
            },
          decoration: InputDecoration(
            hintText: widget.dica,
            border: const OutlineInputBorder(),
          ),
        ),
      ],
    );
  }
}
