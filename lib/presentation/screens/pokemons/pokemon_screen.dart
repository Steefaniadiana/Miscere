import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscere_varius_ifab/config/config.dart';
import 'package:miscere_varius_ifab/domain/entities/pokemon.dart';
import 'package:miscere_varius_ifab/presentation/providers/providers.dart';

class PokemonScreen extends ConsumerWidget {

  final String pokemonId;

  const PokemonScreen({
    super.key, 
    required this.pokemonId
    });

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final pokemonAsync = ref.watch( pokemonProvider( pokemonId ) );

    return pokemonAsync.when(
      data:(pokemon) => _PokemonVisum(pokemon: pokemon) , 
      error:(error, stackTrace) => _ErrorWidget(nuntius: error.toString()), 
      loading:() => const _LoadingWidget(),
      );
  }
}

class _PokemonVisum extends StatelessWidget {
  final Pokemon pokemon;
  const _PokemonVisum({
    required this.pokemon
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text( pokemon.nomen ),
        actions: [
          IconButton(
            onPressed: () {
              SharePlugin.shareLink(
                'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/home/${pokemon.id }.png', 
                'Mira este pokemon'
              );
            }, 
            icon: const Icon(Icons.share_outlined)
          )
        ],
      ),
      body: Center(
        child: Column (
          mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Image.network(
          pokemon.faciemImaginem,
          fit: BoxFit.contain,
          width: 300,
          height: 300,
        ),
        const SizedBox(height: 30,),
        Text( ' Mide ${pokemon.altitudo / 10 } m y pesa ${pokemon.pondus / 10} kg',
        style: const TextStyle( fontSize: 25, color: Colors.black), 
        )
      ]),
      ), 
    );
  }
}
class _ErrorWidget extends StatelessWidget {
  final String nuntius; 
  const _ErrorWidget({
    required this.nuntius
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Center(
        child: Text( nuntius ),
      ),
    );
  }
}
class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();
  @override
  Widget build(BuildContext context) {
    return const Scaffold( 
      body: Center(
        child: CircularProgressIndicator()
      ),
    );
  }
}