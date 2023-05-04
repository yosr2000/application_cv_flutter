import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../menu/drawer.widget.dart';

void main() {
  runApp(CompetencePage());
}

class CompetencePage extends StatefulWidget {
  @override
  _CompetencePageState createState() => _CompetencePageState();
}

class _CompetencePageState extends State<CompetencePage> {
  List<Map<String, dynamic>> _competences = [];

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  void _initDatabase() async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'competences.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE competences(id INTEGER PRIMARY KEY AUTOINCREMENT, framework TEXT, niveau INTEGER)',
        );
      },
      version: 1,
    );

    final Database db = await database;

    final List<Map<String, dynamic>> competences = await db.query('competences');
    setState(() {
      _competences = competences;
    });
  }

  void _ajouterCompetence(String framework, int niveau) async {
    final Future<Database> database = openDatabase(
      join(await getDatabasesPath(), 'competences.db'),
    );

    final db = await database;

    await db.insert(
      'competences',
      {'framework': framework, 'niveau': niveau},
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    final List<Map<String, dynamic>> competences = await db.query('competences');
    setState(() {
      _competences = competences;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        title: Text("niveau de compètence "),
        backgroundColor: Color(0xFF1BBDB8),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pushNamed(context, "/home"); // retour à la page précédente
          },
        ),
      ),
      body: ListView.builder(
        itemCount: _competences.length,
        itemBuilder: (context, index) {
          final competence = _competences[index];
          return ListTile(
            title: Text(competence['framework']),
            subtitle: LinearProgressIndicator(
              value: competence['niveau'] / 100,
              backgroundColor: Colors.grey[200],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
            ),
            trailing: Text('${competence['niveau']}%'),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF1BBDB8),
        onPressed: () async {
          final result = await showDialog(
            context: context,
            builder: (context) => _AjouterCompetenceDialog(),
          );
          if (result != null) {
            _ajouterCompetence(result['framework'], result['niveau']);
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class _AjouterCompetenceDialog extends StatefulWidget {
  @override
  __AjouterCompetenceDialogState createState() =>
      __AjouterCompetenceDialogState();
}

class __AjouterCompetenceDialogState extends State<_AjouterCompetenceDialog> {
  final _formKey = GlobalKey<FormState>();
  late String _framework;
  late int _niveau;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        title: Text('Ajouter une compétence'),
      content: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Framework'),
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer un nom de framework';
                }
                return null;
              },
              onSaved: (value) {
                _framework = value!;
              },
            ),
            TextFormField(
              decoration: InputDecoration(labelText: 'Niveau'),
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Veuillez entrer un niveau de compétence';
                }
                final niveau = int.tryParse(value);
                if (niveau == null || niveau < 0 || niveau > 100) {
                  return 'Veuillez entrer un niveau de compétence entre 0 et 100';
                }
                return null;
              },
              onSaved: (value) {
                _niveau = int.parse(value!);
              },
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Annuler'),
        ),
        ElevatedButton(
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState?.save();
              Navigator.of(context).pop({'framework': _framework, 'niveau': _niveau});
            }
          },
          child: Text('Ajouter'),
        ),
      ],
    );
  }
}
