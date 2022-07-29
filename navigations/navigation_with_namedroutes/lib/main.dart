import 'package:flutter/material.dart';

import 'page_two.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.pink),
      // home: const MyHomePage(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHomePage(),
        '/page-two': (context) => const PageTwo(),
      },
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
              Navigator.of(context).pushNamed('/page-two');
            },
            child: const Text('Página 2'),
          ),
        ),
      ),
    );
  }
}
