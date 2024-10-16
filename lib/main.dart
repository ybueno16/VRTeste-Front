import 'package:flutter/material.dart';
import 'package:vrteste_front/aluno/aluno_page.dart';
import 'package:vrteste_front/curso/curso_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'VR Teste Front',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AlunoPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _telas = [
    const AlunoPage(),
    const CursoPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('VRFaculdade'),
            ),
            ListTile(
              title: const Text('Alunos'),
              leading: const Icon(Icons.people),
              onTap: () {
                setState(() {
                  _currentIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Cursos'),
              leading: const Icon(Icons.school),
              onTap: () {
                setState(() {
                  _currentIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            // Adicione mais opções de menu lateral aqui
          ],
        ),
      ),
      body: _telas[_currentIndex],
    );
  }
}
