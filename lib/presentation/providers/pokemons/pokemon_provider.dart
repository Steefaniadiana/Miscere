import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:miscere_varius_ifab/domain/domain.dart';
import 'package:miscere_varius_ifab/infrastructure/repositories/pokemons_repository_impl.dart';

final pokemonRepositoryProvider = Provider<PokemonsRepository>((ref)  {
  return PokemonsRepositoryImpl() ;
});

final pokemonProvider = FutureProvider.family<Pokemon, String>((ref, id) async {

  final pokemonRepository = ref.watch(pokemonRepositoryProvider);

  final (pokemon, error) = await pokemonRepository.getPokemon(id);

  if (pokemon != null ) return pokemon;

  throw error ;

});