//La idea dle movie mapper es que nosotros podamos crear  una pelicula basado en algun tipo de objeto que vamos a recibir

import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infrastructure/models/moviedb/movie_moviedb.dart';

class MovieMapper {
  //Para usar este metodo sin necesidad de instanciar la clase
  static Movie movieDBToEntity(MovieMovieDB moviedb) => Movie(
      adult: moviedb.adult,
      backdropPath: (moviedb.backdropPath != '') 
      ? 'https://image.tmdb.org/t/p/w500${moviedb.backdropPath}' 
      : 'https://m.media-amazon.com/images/I/61s8vyZLSzL.jpg',
      genreIds: moviedb.genreIds.map((e)=> e.toString()).toList(),
      id: moviedb.id,
      originalLanguage: moviedb.originalLanguage,
      originalTitle: moviedb.originalTitle,
      overview: moviedb.overview,
      popularity: moviedb.popularity,
      posterPath: (moviedb.posterPath != '' )
      ? 'https://image.tmdb.org/t/p/w500${moviedb.posterPath}'
      : 'https://m.media-amazon.com/images/I/61s8vyZLSzL.jpg',
      releaseDate: moviedb.releaseDate,
      title: moviedb.title,
      video: moviedb.video,
      voteAverage: moviedb.voteAverage,
      voteCount: moviedb.voteCount);
}
