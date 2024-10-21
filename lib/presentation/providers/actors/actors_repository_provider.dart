import 'package:cinemapedia/infrastructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: non_constant_identifier_names
final ActorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(datasource: ActorMoviedbDatasource());
});
