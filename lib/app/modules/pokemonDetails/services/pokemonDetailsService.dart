import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemon.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonStats.dart';
import 'package:flutterpokedex/app/modules/pokemonDetails/models/pokemonTypes.dart';

class PokemonDetailsService {
  final dio = Dio();

  Future<Pokemon> getPokemonDetails(String id) async {
    Response response = await dio.get('https://pokeapi.co/api/v2/pokemon/' + id);
    print('response: ' + response.toString());


    // TODO: map
    Future.delayed(const Duration(milliseconds: 500), () {});
    Stats stats = Stats(65, 52, 43, 60, 50, 39);
    Pokemon pokemon = Pokemon(4, Types.fire, 'Charmander', 'https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/4.png', 5, stats);

    return pokemon;
  }
}
