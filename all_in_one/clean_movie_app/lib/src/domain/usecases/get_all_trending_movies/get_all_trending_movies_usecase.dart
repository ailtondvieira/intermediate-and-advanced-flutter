import '../../entities/movie_entity.dart';

abstract class GetAllTrendingMoviesUsecase {
  Future<List<MovieEntity>> getAllTrendingMovies(String timeWindow);
}