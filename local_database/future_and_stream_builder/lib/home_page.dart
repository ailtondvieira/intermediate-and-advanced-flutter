import 'package:flutter/material.dart';
import 'package:future_and_stream_builder/home_repository.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _repository = HomeRepository();
  late Future<List<String>> names;

  @override
  void initState() {
    names = _repository.getAllNames();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FutureBuilder and StreamBuilder'),
      ),
      body: Center(
        child: FutureBuilder(
          future: names,
          builder: (context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.hasData) {
              return Text(snapshot.data!.first);
            }
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
