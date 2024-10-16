import 'package:flutter/material.dart';

class ConfirmDialog extends StatefulWidget {
  final String title;
  final String message;
  final VoidCallback? onPressedConfirm;
  final VoidCallback? onPressedCancel;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onPressedConfirm,
    required this.onPressedCancel,
  });

  @override
  State<ConfirmDialog> createState() => _ConfirmDialogState();
}

class _ConfirmDialogState extends State<ConfirmDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      content: Text(widget.message),
      actions: [
        ElevatedButton(
          child: Text('Cancelar'),
          onPressed: widget.onPressedCancel,
        ),
        ElevatedButton(
          child: Text('Confirmar'),
          onPressed: widget.onPressedConfirm,
        ),
      ],
    );
  }
}
