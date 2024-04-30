import 'package:flutter/material.dart';
import 'package:miscere_varius_ifab/config/config.dart';

class PokemonScreen extends StatelessWidget {

  final String pokemonId;

  const PokemonScreen({
    super.key, 
    required this.pokemonId
    });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text ('Pokemon: $pokemonId'),
        actions: [ 
          IconButton(
            onPressed: () { 
              SharePlugin.shareLink(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$pokemonId.png', 
                'Churri mira este pokemon chulisimo'
              );
             }, 
            icon: const Icon(Icons.share_outlined)
          )
        ],
      ),
      body: Center( 
        child: Image.network(
          'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/$pokemonId.png',
          fit: BoxFit.contain,
          width: 300,
          height: 300,
          ),
        )
    );
  }
}