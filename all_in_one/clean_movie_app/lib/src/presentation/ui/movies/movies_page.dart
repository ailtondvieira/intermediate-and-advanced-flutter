import 'package:flutter/material.dart';

import 'widgets/body_movies.dart';
import 'widgets/drawer_movies.dart';

class MoviesPage extends StatelessWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerMovies(),
      appBar: AppBar(title: const Text('Movies')),
      body: const BodyMovies(),
    );
  }
}
