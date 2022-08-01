import 'package:flutter/material.dart';

import 'view_image_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hero Animation'),
      ),
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => const ViewImagePage()),
            );
          },
          child: Hero(
            tag: 'img1',
            child: Image.network(
              'https://wallpaperaccess.com/full/1975552.jpg',
              height: 200,
            ),
          ),
        ),
      ),
    );
  }
}
