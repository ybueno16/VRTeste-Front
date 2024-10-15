import 'package:flutter/material.dart';
import 'package:vrteste_front/commons/card_commons.dart';

class CursoPage extends StatefulWidget {
  const CursoPage({super.key});

  @override
  State<CursoPage> createState() => _CursoPageState();
}

class _CursoPageState extends State<CursoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Alunos')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: IconButton(
                  onPressed: () {  },
                  icon: const Icon(Icons.add),
),
                ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              children: [
                Expanded(
                  child: CardCommons(
                    height: 200,
                    width: 200,
                    children: [
                      Text('Teste'),
                      Text('Teste1'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
