import 'package:dio/dio.dart';
import 'package:miscere_varius_ifab/domain/domain.dart';

class PokemonsDatasourceImpl implements PokemonsDatasource {

  final Dio dio;

  PokemonsDatasourceImpl():dio = Dio(BaseOptions(baseUrl: 'https://pokeapi.co/api/v2'));

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {

    try {
      final responsio = await dio.get('/pokemon/$id') ;
      return (null, 'Churri que no sale el Pokemon');

    } catch (e) {
      return (null, 'Churri que no sale el Pokemon');
    } 

  }

}