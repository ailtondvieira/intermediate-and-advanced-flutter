import 'package:flutter/material.dart';
import 'package:simple_navigation/page_two.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const MyHomePage(),
    ),
  );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const PageTwo()),
              );
              // Navigator.of(context).pushReplacement(
              //   MaterialPageRoute(builder: (context) => const PageTwo()),
              // );
            },
            child: const Text('Página 2'),
          ),
        ),
      ),
    );
  }
}
