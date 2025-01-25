
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier, List<Movie>>((ref) {

  final fetchMoreMovies = ref.watch( movieRepositoryProvider ).getNowPlaying;


  return MoviesNotifier(
  fetchMoreMovies: fetchMoreMovies
  );
});


typedef MovieCallback = Future <List<Movie>> Function({int page});

//proque notifer porque eso me va a permitir controlar arriba el state
//el statenotifer es simplemente es una clase que sirve para manejar este estadp  de list<Movie>>
class MoviesNotifier extends StateNotifier<List<Movie>>{

  //Con esto voy a saber cual es la pagina actual
  int currentPage=0; 
  MovieCallback fetchMoreMovies;
 
  MoviesNotifier({
    required this.fetchMoreMovies,
  }): super([]);

  //AHora me creo un metodo que no va regresar nada
  //su objetivo va hacer alguna notificacion
  Future <void> loadNextPage() async{
    currentPage++;

    final List<Movie> movies = await fetchMoreMovies (page: currentPage);
    state = [...state, ...movies];
  }


}