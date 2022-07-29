import 'package:flutter/material.dart';

class ThreePage extends StatelessWidget {
  const ThreePage({Key? key}) : super(key: key);

  static const route = '/page-three';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Three'),
      ),
      body: Container(),
    );
  }
}
