//Los repositorios son los que van a llamar al datesource
//Porque el repositorio va hacer el que me va a permitir poder cambiar el Datasource

import 'package:cinemapedia/domain/entities/movie.dart';

abstract class MoviesRepository {

  Future<List<Movie>> getNowPlaying ({int page = 1});


}