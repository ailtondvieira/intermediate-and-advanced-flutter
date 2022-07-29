import 'package:flutter/material.dart';

import 'three_page.dart';

class TwoPage extends StatelessWidget {
  const TwoPage({Key? key}) : super(key: key);

  static const route = '/page-two';

  @override
  Widget build(BuildContext context) {
    final textinho = ModalRoute.of(context)!.settings.arguments as List<String>;

    return Scaffold(
      appBar: AppBar(
        title: Text(textinho[0]),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(ThreePage.route);
          },
          child: const Text('Go to page 3'),
        ),
      ),
    );
  }
}
