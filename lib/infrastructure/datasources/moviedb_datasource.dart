//dio es un gestor de peticiones HTTP para poder manejarlo
//BaseUrl significa que cuando voy a utilizar la instancia de Dio
import 'package:cinemapedia/config/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';



class MoviedbDatasource extends MoviesDatasource{
  
  final dio = Dio(BaseOptions(
    
      baseUrl: 'https://api.themoviedb.org/3',
      queryParameters: {
        'api_key' : Environment.theMovieDbKey,
        'language': 'es-MX'
      },
    
      )
    );
  
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {
    //La peliculas que estan en el cine
    final response = await dio.get('/movie/now_playing');

    final MovieDBResponse = MovieDbResponse.fromJson(response.data); //recibimos nuesteo json

    //Se regresa un listado de movies
    final List<Movie> movies= MovieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster') // es para que no pase y no se cree esa pelicula para los que no tiene los poster 
    .map( //Lo mapeamos
      (moviedb) => MovieMapper.movieDBToEntity(moviedb)
      ).toList(); //los Results son las peliculas
    
    return movies;
  }




}