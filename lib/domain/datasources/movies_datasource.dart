import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page = 1});

  Future<List<Movie>> getPopular({int page = 1});

  Future<List<Movie>> topRated({int page = 1});

  Future<List<Movie>> getComing({int page = 1});

  Future<Movie> getMovieById(String id);
  Future<List<Movie>> searchMovie(String query);
}
