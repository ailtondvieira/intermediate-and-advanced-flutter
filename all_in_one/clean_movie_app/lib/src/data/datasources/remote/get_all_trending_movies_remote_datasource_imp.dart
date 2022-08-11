import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../../domain/entities/movie_entity.dart';
import '../../dtos/movie_dto.dart';
import '../get_all_trending_movies_datasource.dart';

class GetAllTrendingMoviesRemoteDatasourceImp implements GetAllTrendingMoviesDatasource {
  final Dio _dio;
  GetAllTrendingMoviesRemoteDatasourceImp(this._dio);

  @override
  Future<List<MovieEntity>> getAllTrendingMovies(String timeWindow) async {
    List<MovieEntity> movies = [];

    try {
      final response = await _dio.get(
        'https://api.themoviedb.org/3/trending/movie/$timeWindow',
        queryParameters: {'api_key': '3bb94fd683dec2f0901cfd89b177de11'},
      );

      movies = List.from(
        response.data['results'].map((movie) {
          return MovieDto.fromMap(movie);
        }),
      );
    } catch (e) {
      debugPrint(e.toString());
    }

    return movies;
  }
}
