import 'package:flutter/material.dart';
import 'package:project_sqflite/database_helper.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  final dbHelper = DatabaseHelper.instance;

  Future<String> getText() async {
    return dbHelper.getText();
  }

  Future saveText() async {
    if (textController.text.isNotEmpty) {
      var response = await dbHelper.insertText(textController.text);
      print(response);
      if (response == 0) {
        print('Deu erro ao salvar');
      } else {
        print('Deu certo salvar');
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sqflite'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'Coloque o título'),
          ),
          FutureBuilder(
            future: getText(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data);
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await saveText();
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
