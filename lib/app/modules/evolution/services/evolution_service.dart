import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutterpokedex/app/modules/evolution/models/evolution_models.dart';

class EvolutionService {
  final dio = Dio();

  Future<EvolutionResponse> getEvolutionsByPokemon(
      String evolutionChain) async {
    var url = await getPokemonSpecies(evolutionChain);
    Response evolutionResponse = await dio.get(url);

    return _parseEvolutions(evolutionResponse.toString());
  }

  Future<String> getPokemonSpecies(String pokemonSpecies) async {
    Response speciesResponse = await dio.get(pokemonSpecies);
    final parsed = json.decode(speciesResponse.toString());

    return parsed['evolution_chain']['url'];
  }

  EvolutionResponse _parseEvolutions(String responseBody) {
    final parsed = json.decode(responseBody);

    return EvolutionResponse.fromJson(parsed);
  }
}
