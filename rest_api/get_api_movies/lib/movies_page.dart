import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'movie_model.dart';
import 'movie_repository.dart';

class MoviesPage extends StatefulWidget {
  const MoviesPage({Key? key}) : super(key: key);

  @override
  State<MoviesPage> createState() => _MoviesPageState();
}

class _MoviesPageState extends State<MoviesPage> {
  MovieRepository repository = MovieRepository(Dio());
  late Future<List<MovieModel>> movies;

  @override
  void initState() {
    movies = repository.getAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movies'),
      ),
      body: Center(
        child: FutureBuilder(
          future: movies,
          builder: (context, AsyncSnapshot<List<MovieModel>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  MovieModel movie = snapshot.data![index];
                  return ListTile(
                    title: Text(movie.title),
                    subtitle: Text(movie.description),
                  );
                },
              );
            }

            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
