import 'package:flutter/material.dart';
import 'package:vrteste_front/aluno/aluno_page.dart';
import 'package:vrteste_front/curso/curso_page.dart';
import 'package:vrteste_front/matricula/matricula_page.dart';

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
      home: const MyHomePage(),
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
    const MatriculaPage(),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _telas[0]),
                );
              },
            ),
            ListTile(
              title: const Text('Cursos'),
              leading: const Icon(Icons.school),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _telas[1]),
                );
              },
            ),
            ListTile(
              title: const Text('Matriculas'),
              leading: const Icon(Icons.assignment),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => _telas[2]),
                );
              },
            ),
          ],
        ),
      ),
      body: _telas[_currentIndex],
    );
  }
}
