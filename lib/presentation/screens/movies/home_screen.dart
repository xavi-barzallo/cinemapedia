import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatelessWidget {
  
  static const name = 'home-screen';
  
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return   const Scaffold(
      body:  _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
  }
  
  
  @override
  Widget build(BuildContext context) {
    
    //esto es un listado de peliculas
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    
    //if(nowPlayingMovies.length ==0) return CircularProgressIndicator();

    return Column(

      children: [

        const CustomAppbar(),

        MoviesSlidesshow(movies: nowPlayingMovies)

      ],
    );
  }
} 



 /**

 Expanded( //el expended lo que hace es que dado el padre expanda todo lo posible es porque dio error 
          child: ListView.builder(
            itemCount: nowPlayingMovies.length,
            itemBuilder: (context, index) {
              final movie = nowPlayingMovies[index];
              return ListTile(
                title: Text(movie.title),
              );
            },),
        )

 */