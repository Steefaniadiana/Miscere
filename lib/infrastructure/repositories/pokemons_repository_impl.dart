import 'package:miscere_varius_ifab/domain/domain.dart';
import 'package:miscere_varius_ifab/infrastructure/datasources/pokemons_datasource_impl.dart';

class PokemonsRepositoryImpl extends PokemonsRepository {

  final PokemonsDatasource datasource;

  PokemonsRepositoryImpl ({ PokemonsDatasource? datasource }): datasource = datasource ?? PokemonsDatasourceImpl();

  @override
  Future<(Pokemon?, String)> getPokemon(String id) async {

    return datasource.getPokemon(id);
  }

}