import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../../domain/usecases/get_all_trending_movies/get_all_trending_movies_usecase.dart';

class MoviesNotifier extends StateNotifier<List<MovieEntity>> {
  final GetAllTrendingMoviesUsecase _usecase;
  MoviesNotifier(this._usecase) : super([]) {
    getAllTrendingMovies('day');
  }

  Future<void> getAllTrendingMovies(String timeWindow) async {
    state = [];
    await Future.delayed(const Duration(seconds: 3));
    state = await _usecase.getAllTrendingMovies(timeWindow);
  }
}
