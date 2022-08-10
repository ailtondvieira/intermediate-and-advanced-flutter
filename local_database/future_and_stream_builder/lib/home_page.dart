import 'dart:async';

import 'package:flutter/material.dart';

import 'home_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _repository = HomeRepository();
  final StreamController<List<String>> streamController = StreamController();
  late Future<List<String>> names;

  @override
  void initState() {
    names = _repository.getAllNames();
    getAllNamesForStream();
    super.initState();
  }

  void getAllNamesForStream() async {
    List<String> names = await _repository.getAllNames();
    streamController.add(names);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder and StreamBuilder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
              future: names,
              builder: (context, AsyncSnapshot<List<String>> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    snapshot.data![0],
                    style: const TextStyle(fontSize: 20),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
            const SizedBox(height: 20),
            StreamBuilder(
              stream: _repository.timedCounter(const Duration(seconds: 1), 10),
              builder: (context, AsyncSnapshot<int> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "${snapshot.data}",
                    style: const TextStyle(fontSize: 40),
                  );
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }
}
