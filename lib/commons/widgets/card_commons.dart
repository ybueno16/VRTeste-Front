import 'package:flutter/material.dart';

class CardCommons extends StatefulWidget {
  final double height;
  final double width;
  final List<Widget> children;

  const CardCommons({
    super.key,
    required this.height,
    required this.width,
    required this.children,
  });

  @override
  State<CardCommons> createState() => _CardCommonsState();
}

class _CardCommonsState extends State<CardCommons> {
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: SizedBox(
        height: widget.height,
        width: widget.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: widget.children,
          ),
        ),
      ),
    );
  }
}