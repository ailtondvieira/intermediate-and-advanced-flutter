import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

import 'widgets/body_home.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    timeDilation = 5;

    return Scaffold(
      appBar: AppBar(title: const Text('Simple Hero Radial')),
      body: const BodyHome(),
    );
  }
}