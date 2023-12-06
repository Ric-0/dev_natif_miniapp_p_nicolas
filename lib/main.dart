import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Path Provider Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _documentsPath = '';
  String _externalStoragePath = '';

  @override
  void initState() {
    super.initState();

    // Récupération du chemin du répertoire des documents
    _getDocumentsPath();

    // Récupération du chemin du répertoire de stockage externe
    _getExternalStoragePath();
  }

  void _getDocumentsPath() async {
    // Récupération du chemin du répertoire des documents
    final Directory directory = await getApplicationDocumentsDirectory();
    _documentsPath = directory.path;

    // Mise à jour de l'état de l'application
    setState(() {});
  }

  void _getExternalStoragePath() async {
    // Récupération du chemin du répertoire de stockage externe
    final Directory? directory = await getExternalStorageDirectory();
    // Vérification que celui-ci existe car sur Android il est trouvé
    // mais pas sur les autres platformes (Windows, Linux...)
    if (directory != null) {
      _externalStoragePath = directory.path;
    }

    // Mise à jour de l'état de l'application
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Path Provider Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Répertoire des documents :',
              style: TextStyle(fontSize: 20),
            ),
            // Affichage du du chemin du répertoire des documents
            Text(_documentsPath),
            const SizedBox(height: 20),
            const Text(
              'Répertoire de stockage externe :',
              style: TextStyle(fontSize: 20),
            ),
            // Affichage du chemin du répertoire de stockage externe
            Text(_externalStoragePath),
          ],
        ),
      ),
    );
  }
}
