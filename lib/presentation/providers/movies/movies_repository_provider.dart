
import 'package:cinemapedia/infrastructure/datasources/the_moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//Este repositorio es inmutable, por lo que no necesita un estado
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(TheMovieDBDatasource());
});