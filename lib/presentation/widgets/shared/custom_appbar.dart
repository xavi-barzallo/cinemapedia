import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    final tittleStyle = Theme.of(context).textTheme.titleMedium;

    return  SafeArea( // estoo es para que no choque con lo de arriba
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity, //esto es para dale todo el ancho que puedas
          child: Row(
            children: [
              Icon(Icons.movie_outlined, color: colors.primary),
              const SizedBox(width: 5,),
              Text('Cinemapedia', style: tittleStyle,),
      
              const Spacer(), // es como que ustedes hagan que este sea un widget que tomo todo el espacio posible de un Flex Layout
              
              IconButton(
                onPressed: (){}, 
                icon: const Icon(Icons.search))
            ],
          ),
        ),
        )
      );
  }
}