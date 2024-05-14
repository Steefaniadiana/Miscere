import 'package:dio/dio.dart';
import 'package:miscere_varius_ifab/domain/domain.dart';
import 'package:miscere_varius_ifab/infrastructure/mappers/pokemon_mapper.dart';

class PokemonsDatasourceImpl implements PokemonsDatasource {

  final Dio dio;

  PokemonsDatasourceImpl():dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {

    try {
      final responsio = await dio.get('/pokemon/$id') ;

      final pokemon = PokemonMapper.pokeApiPokemonToEntity(responsio.data);
      
       return (pokemon, 'Churri mira que Pokemon más chuloo');

    } catch (e) {
      return (null, 'Churri que no sale el Pokemon');
    } 

  }

}