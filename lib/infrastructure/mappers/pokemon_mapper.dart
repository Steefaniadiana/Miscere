import 'package:miscere_varius_ifab/domain/entities/pokemon.dart';
import 'package:miscere_varius_ifab/infrastructure/models/pokeapi_pokemon_responsio.dart';

class PokemonMapper {
  static Pokemon pokeApiPokemonToEntity( Map<String, dynamic> json) {
    
    final pokeApiPokemon = PokeApiPokemonResponsio.fromJson(json);
    return Pokemon ( 
      id: pokeApiPokemon.id,
      nomen: pokeApiPokemon.name,
      faciemImaginem: pokeApiPokemon.sprites.other?.home.frontDefault ?? pokeApiPokemon.sprites.frontDefault,
      pondus: pokeApiPokemon.weight.toDouble(),
      altitudo: pokeApiPokemon.height.toDouble(),
    );
  }
}