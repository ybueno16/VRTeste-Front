import 'package:flutter/material.dart';

class ErrorToast extends StatelessWidget {
  final String errorMessage;

  const ErrorToast({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Text(
        errorMessage,
        style: const TextStyle(color: Colors.white),
      ),
    );
  }

  static void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content:
            ErrorToast(errorMessage: "Houve algum erro ao realizar a operaçao"),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }
}
