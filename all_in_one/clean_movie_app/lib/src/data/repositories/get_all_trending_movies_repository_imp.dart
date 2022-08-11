import '../../domain/entities/movie_entity.dart';
import '../../domain/repositories/get_all_trending_movies_repository.dart';
import '../datasources/get_all_trending_movies_datasource.dart';

class GetAllTrendingMoviesRepositoryImp implements GetAllTrendingMoviesRepository {
  final GetAllTrendingMoviesDatasource _datasource;
  GetAllTrendingMoviesRepositoryImp(this._datasource);

  @override
  Future<List<MovieEntity>> getAllTrendingMovies(String timeWindow) async {
    return await _datasource.getAllTrendingMovies(timeWindow);
  }
}
