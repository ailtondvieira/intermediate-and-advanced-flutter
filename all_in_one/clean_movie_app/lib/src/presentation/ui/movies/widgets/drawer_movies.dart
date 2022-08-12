import 'package:clean_movie_app/src/presentation/riverpod/movies/movies_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class DrawerMovies extends HookConsumerWidget {
  const DrawerMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Colors.pink),
            child: Text(
              'M',
              style: TextStyle(fontSize: 100),
            ),
          ),
          ListTile(
            title: const Text('Trazer filmes diários'),
            onTap: () {
              ref.read(moviesNotifierProvider.notifier).getAllTrendingMovies('day');
              Navigator.of(context).pop();
            },
          ),
          ListTile(
            title: const Text('Trazer filmes semanais'),
            onTap: () {
              ref.read(moviesNotifierProvider.notifier).getAllTrendingMovies('week');
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
    );
  }
}
