import 'package:flutter/material.dart';

import 'three_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static const route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: FractionallySizedBox(
          widthFactor: 0.6,
          child: ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(ThreePage.route);
            },
            child: const Text('Go to page 2'),
          ),
        ),
      ),
    );
  }
}
