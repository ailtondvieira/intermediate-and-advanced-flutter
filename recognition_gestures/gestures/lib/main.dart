import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gestures',
      theme: ThemeData(primarySwatch: Colors.pink),
      home: const Main(),
    ),
  );
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gestures'),
      ),
      body: Center(
        child: GestureDetector(
          onLongPress: () {
            print('Me seguraram aqui, me largaa!');
          },
          onDoubleTap: () {
            print('Fizeram um double click em mim');
          },
          onTap: () {
            print('Fui clicado');
          },
          child: Container(
            height: 200,
            width: 200,
            color: Colors.pink,
          ),
        ),
      ),
    );
  }
}
