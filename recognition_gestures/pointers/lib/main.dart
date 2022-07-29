import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pointers',
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
        title: const Text('Pointers'),
      ),
      body: Center(
        child: Listener(
          child: Container(
            height: 200,
            width: 200,
            color: Colors.pink,
          ),
          onPointerDown: (event) {
            print('down $event');
          },
          onPointerUp: (event) {
            print('up $event');
          },
          onPointerMove: (event) {
            print('move $event');
          },
          onPointerCancel: (event) {
            print('move $event');
          },
        ),
      ),
    );
  }
}
