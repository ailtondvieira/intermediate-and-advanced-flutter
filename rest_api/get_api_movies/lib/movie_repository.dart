import 'package:dio/dio.dart';
import 'package:get_api_movies/movie_model.dart';

class MovieRepository {
  final Dio dio;
  MovieRepository(this.dio);

  Future<List<MovieModel>> getAllMovies() async {
    List<MovieModel> movies = [];

    final response = await dio.get('https://ghibliapi.herokuapp.com/films');
    movies = List.from(
      response.data.map((movie) {
        return MovieModel.fromMap(movie);
      }),
    );

    return movies;
  }
}
