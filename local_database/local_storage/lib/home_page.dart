import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final textController = TextEditingController();
  final storage = LocalStorage('data.json');

  saveInfoStorage() async {
    await storage.setItem('title', textController.text);
    textController.clear();
    setState(() {});
  }

  removeInfoStorage() async {
    await storage.deleteItem('title');
    setState(() {});
  }

  String getInfoStorage() {
    return storage.getItem('title') ?? 'não encontrado';
  }

  clearStorage() async {
    await storage.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(''),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'Escreva alguma coisa'),
          ),
          FutureBuilder(
            future: storage.ready,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(getInfoStorage());
              }
              return const CircularProgressIndicator();
            },
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              removeInfoStorage();
            },
            child: const Icon(Icons.delete),
          ),
          FloatingActionButton(
            onPressed: () {
              saveInfoStorage();
            },
            child: const Icon(Icons.save),
          ),
        ],
      ),
    );
  }
}
