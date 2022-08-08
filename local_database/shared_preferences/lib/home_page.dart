import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _prefs = SharedPreferences.getInstance();
  final textController = TextEditingController();

  saveInfoStorage() async {
    final myPrefs = await _prefs;
    await myPrefs.setString('title', textController.text);
    setState(() {});
  }

  Future<String> getInfoStorage() async {
    return _prefs.then((prefs) => prefs.getString('title') ?? '');
  }

  removeInfoStorage() async {
    final myPrefs = await _prefs;
    await myPrefs.remove('title');
    setState(() {});
  }

  removeAllInfoStorage() async {
    final myPrefs = await _prefs;
    await myPrefs.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shared Preferences'),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: textController,
            decoration: const InputDecoration(hintText: 'Escreva alguma coisa'),
          ),
          FutureBuilder(
            future: getInfoStorage(),
            builder: (context, AsyncSnapshot<String> snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!);
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
