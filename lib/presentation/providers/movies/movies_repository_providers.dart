// se descragra flutter_riverpod 
import 'package:cinemapedia/infrastructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infrastructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

//este provider solo va ser de lectura, este repositorio es inmutable, 
//Su objetico basicamente es proporcionar a todos los demas providers, la informaicon necesaria para que pueda consultar la informacion 
final movieRepositoryProvider = Provider((ref) {
  return MovieRepositoryImpl(MoviedbDatasource());
}); 
